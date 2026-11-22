-- IQ Ball Puzzle — Supabase schema
-- Run this in Supabase SQL Editor (supabase.com → project → SQL Editor)

-- ───────────────────────────────────────────────
-- Scores table (global leaderboard)
-- ───────────────────────────────────────────────
create table if not exists public.scores (
  id           uuid    default gen_random_uuid() primary key,
  user_id      uuid    references auth.users(id) on delete cascade not null,
  display_name text    not null,
  avatar_url   text,
  chal_id      integer not null,
  level        text,
  time_secs    numeric not null,
  scored_date  date    default current_date,
  created_at   timestamptz default now()
);

alter table public.scores enable row level security;

create policy "Anyone can view scores" on public.scores
  for select using (true);

create policy "Users can insert their own scores" on public.scores
  for insert with check (auth.uid() = user_id);

-- ───────────────────────────────────────────────
-- Completed challenges (per-user progress)
-- ───────────────────────────────────────────────
create table if not exists public.completed (
  user_id      uuid    references auth.users(id) on delete cascade not null,
  chal_id      integer not null,
  best_time    numeric,
  completed_at timestamptz default now(),
  primary key (user_id, chal_id)
);

alter table public.completed enable row level security;

create policy "Users can view their own completed" on public.completed
  for select using (auth.uid() = user_id);

create policy "Users can insert their completed" on public.completed
  for insert with check (auth.uid() = user_id);

create policy "Users can update their completed" on public.completed
  for update using (auth.uid() = user_id);

-- ───────────────────────────────────────────────
-- Leaderboard view (best score per user per challenge)
-- ───────────────────────────────────────────────
create or replace view public.leaderboard as
select distinct on (chal_id, user_id)
  id, user_id, display_name, avatar_url, chal_id, level, time_secs, scored_date
from public.scores
order by chal_id, user_id, time_secs asc;
