/*
  # Add How To Use Column to Tools Table

  1. Changes
    - Add `howToUse` column to tools table
    - Set column type as text to store usage instructions
    - Add default value as null

  2. Description
    - Allows tools to have detailed usage instructions
    - Supports the admin panel's "How to Use" section
*/

-- Add howToUse column to tools table
ALTER TABLE tools
ADD COLUMN IF NOT EXISTS "howToUse" text;