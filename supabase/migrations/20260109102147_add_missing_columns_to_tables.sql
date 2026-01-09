/*
  # Add Missing Columns to Tables

  1. Changes to `tools` table
    - Add `seo_title` (text) - SEO optimized title
    - Add `seo_description` (text) - SEO meta description
    - Add `image_url` (text) - Tool image/logo URL
    - Add `how_to_use` (text) - Usage instructions

  2. Changes to `categories` table
    - Add `seo_title` (text) - SEO optimized title
    - Add `seo_description` (text) - SEO meta description
    - Add `image_url` (text) - Category image URL

  3. Changes to `agents` table
    - Add `seo_title` (text) - SEO optimized title
    - Add `seo_description` (text) - SEO meta description
    - Add `image_url` (text) - Agent image URL
    - Add `is_available_24_7` (boolean) - 24/7 availability flag
    - Add `user_count` (integer) - Number of users
    - Add `has_fast_response` (boolean) - Fast response capability
    - Add `is_secure` (boolean) - Security features enabled
*/

-- Add columns to tools table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'tools' AND column_name = 'seo_title'
  ) THEN
    ALTER TABLE tools ADD COLUMN seo_title text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'tools' AND column_name = 'seo_description'
  ) THEN
    ALTER TABLE tools ADD COLUMN seo_description text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'tools' AND column_name = 'image_url'
  ) THEN
    ALTER TABLE tools ADD COLUMN image_url text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'tools' AND column_name = 'how_to_use'
  ) THEN
    ALTER TABLE tools ADD COLUMN how_to_use text;
  END IF;
END $$;

-- Add columns to categories table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'categories' AND column_name = 'seo_title'
  ) THEN
    ALTER TABLE categories ADD COLUMN seo_title text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'categories' AND column_name = 'seo_description'
  ) THEN
    ALTER TABLE categories ADD COLUMN seo_description text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'categories' AND column_name = 'image_url'
  ) THEN
    ALTER TABLE categories ADD COLUMN image_url text;
  END IF;
END $$;

-- Add columns to agents table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'seo_title'
  ) THEN
    ALTER TABLE agents ADD COLUMN seo_title text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'seo_description'
  ) THEN
    ALTER TABLE agents ADD COLUMN seo_description text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'image_url'
  ) THEN
    ALTER TABLE agents ADD COLUMN image_url text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'is_available_24_7'
  ) THEN
    ALTER TABLE agents ADD COLUMN is_available_24_7 boolean DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'user_count'
  ) THEN
    ALTER TABLE agents ADD COLUMN user_count integer DEFAULT 0;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'has_fast_response'
  ) THEN
    ALTER TABLE agents ADD COLUMN has_fast_response boolean DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'agents' AND column_name = 'is_secure'
  ) THEN
    ALTER TABLE agents ADD COLUMN is_secure boolean DEFAULT false;
  END IF;
END $$;
