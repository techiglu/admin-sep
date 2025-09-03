/*
  # Fix RLS Policies for Admin Operations

  1. Security Changes
    - Update RLS policies to allow public insert/update operations
    - Add storage policies for image uploads
    - Fix authentication issues for admin operations

  2. Storage Setup
    - Create storage bucket for tool images
    - Add public access policies for storage
*/

-- Create storage bucket for tool images if it doesn't exist
INSERT INTO storage.buckets (id, name, public)
VALUES ('tool-images', 'tool-images', true)
ON CONFLICT (id) DO NOTHING;

-- Add storage policies for tool images
CREATE POLICY "Allow public uploads to tool-images bucket"
  ON storage.objects
  FOR INSERT
  TO public
  WITH CHECK (bucket_id = 'tool-images');

CREATE POLICY "Allow public read access to tool-images bucket"
  ON storage.objects
  FOR SELECT
  TO public
  USING (bucket_id = 'tool-images');

CREATE POLICY "Allow public updates to tool-images bucket"
  ON storage.objects
  FOR UPDATE
  TO public
  USING (bucket_id = 'tool-images')
  WITH CHECK (bucket_id = 'tool-images');

CREATE POLICY "Allow public deletes from tool-images bucket"
  ON storage.objects
  FOR DELETE
  TO public
  USING (bucket_id = 'tool-images');

-- Update RLS policies for categories table
DROP POLICY IF EXISTS "Allow public insert access for categories" ON categories;
CREATE POLICY "Allow public insert access for categories"
  ON categories
  FOR INSERT
  TO public
  WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public update access for categories" ON categories;
CREATE POLICY "Allow public update access for categories"
  ON categories
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Update RLS policies for tools table
DROP POLICY IF EXISTS "Allow public insert access for tools" ON tools;
CREATE POLICY "Allow public insert access for tools"
  ON tools
  FOR INSERT
  TO public
  WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public update access for tools" ON tools;
CREATE POLICY "Allow public update access for tools"
  ON tools
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Update RLS policies for agents table
DROP POLICY IF EXISTS "Allow public insert access for agents" ON agents;
CREATE POLICY "Allow public insert access for agents"
  ON agents
  FOR INSERT
  TO public
  WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public update access for agents" ON agents;
CREATE POLICY "Allow public update access for agents"
  ON agents
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);