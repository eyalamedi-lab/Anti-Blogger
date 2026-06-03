-- supabase_schema.sql
-- Run this SQL in your Supabase SQL Editor to set up the 'articles' table

-- 1. Create the 'articles' table
CREATE TABLE IF NOT EXISTS articles (
    -- Primary key generated automatically as a UUID v4
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    
    -- Prompt text entered by user
    prompt TEXT,
    
    -- Generated catchy title of the article
    title TEXT,
    
    -- Full body of the generated article (long text)
    article TEXT,
    
    -- Creation timestamp defaulting to current UTC time
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Enable Row Level Security (RLS) on the table
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- 3. Create policies to allow anonymous/public operations (ideal for local testing)

-- Allow public read access to all articles
CREATE POLICY "Allow public read access" 
ON articles FOR SELECT 
TO anon 
USING (true);

-- Allow public inserts (saving new articles)
CREATE POLICY "Allow public insert access" 
ON articles FOR INSERT 
TO anon 
WITH CHECK (true);

-- Allow public deletes (deleting articles from history)
CREATE POLICY "Allow public delete access" 
ON articles FOR DELETE 
TO anon 
USING (true);
