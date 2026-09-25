-- ==========================================================================
-- FASHION EMPIRES - SUPABASE DATABASE INITIALIZATION SCRIPT
-- Project ID: cnrwejtfdjmwxblcyomh
-- URL: https://cnrwejtfdjmwxblcyomh.supabase.co
-- Run this in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/cnrwejtfdjmwxblcyomh/sql/new
-- ==========================================================================

-- 1. Create Products Table
CREATE TABLE IF NOT EXISTS fe_products (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT NOT NULL,
  sub_category TEXT,
  sku TEXT,
  tech_tag TEXT,
  badge TEXT,
  price_estimate TEXT,
  moq TEXT,
  fabric TEXT,
  description TEXT,
  image TEXT,
  swatches JSONB DEFAULT '[]'::jsonb,
  features JSONB DEFAULT '[]'::jsonb,
  customization JSONB DEFAULT '[]'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Create Categories Table (Symmetrical 6 Divisions)
CREATE TABLE IF NOT EXISTS fe_categories (
  id TEXT PRIMARY KEY,
  division TEXT,
  title TEXT NOT NULL,
  meta TEXT,
  link TEXT,
  image TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Create Hero Slider Banners Table (4 Sliding Banners)
CREATE TABLE IF NOT EXISTS fe_banners (
  id TEXT PRIMARY KEY,
  tag TEXT,
  title TEXT NOT NULL,
  description TEXT,
  btn_text1 TEXT,
  btn_link1 TEXT,
  btn_text2 TEXT,
  btn_link2 TEXT,
  image TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Create Site Settings Table (Company Info & Contacts)
CREATE TABLE IF NOT EXISTS fe_settings (
  id TEXT PRIMARY KEY,
  company_name TEXT,
  email TEXT,
  phone TEXT,
  phone_international TEXT,
  address TEXT,
  export_countries TEXT,
  monthly_capacity TEXT,
  qc_pass_rate TEXT,
  sample_turnaround TEXT,
  primary_color TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. Create Customer RFQ Inquiries & Lead Generation Table
CREATE TABLE IF NOT EXISTS fe_inquiries (
  id BIGSERIAL PRIMARY KEY,
  customer_name TEXT,
  company_brand TEXT,
  email TEXT,
  country TEXT,
  category TEXT,
  quantity TEXT,
  customization TEXT,
  details TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS) & Grant Access with publishable key
ALTER TABLE fe_products ENABLE ROW LEVEL SECURITY;
ALTER TABLE fe_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE fe_banners ENABLE ROW LEVEL SECURITY;
ALTER TABLE fe_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE fe_inquiries ENABLE ROW LEVEL SECURITY;

-- Security Policies (Allow Public Read & Anonymous Insert/Update for Frontend + Admin)
DROP POLICY IF EXISTS "Allow public read fe_products" ON fe_products;
DROP POLICY IF EXISTS "Allow public all fe_products" ON fe_products;
CREATE POLICY "Allow public all fe_products" ON fe_products FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public read fe_categories" ON fe_categories;
DROP POLICY IF EXISTS "Allow public all fe_categories" ON fe_categories;
CREATE POLICY "Allow public all fe_categories" ON fe_categories FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public read fe_banners" ON fe_banners;
DROP POLICY IF EXISTS "Allow public all fe_banners" ON fe_banners;
CREATE POLICY "Allow public all fe_banners" ON fe_banners FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public read fe_settings" ON fe_settings;
DROP POLICY IF EXISTS "Allow public all fe_settings" ON fe_settings;
CREATE POLICY "Allow public all fe_settings" ON fe_settings FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow public all fe_inquiries" ON fe_inquiries;
CREATE POLICY "Allow public all fe_inquiries" ON fe_inquiries FOR ALL USING (true) WITH CHECK (true);
