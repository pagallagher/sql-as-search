-- Full Stage Learning to Rank: Multi-Stage Ranking Framework in SQL

-- PRE-FILTER STAGE: Retrieval (fast, broad filtering)
-- Only include active products in the requested category
WITH filtered_products AS (
  SELECT 
    product_id,
    name,
    price,
    rating,
    num_reviews
  FROM products
  WHERE 
    status = 'active'
    AND category = 'electronics'
    AND price > 0
),

-- RANKING STAGE: Score and rank products
ranked_products AS (
  SELECT 
    product_id,
    name,
    price,
    rating,
    num_reviews,
    -- Composite ranking score
    (rating * 0.6 + LOG(num_reviews + 1) * 0.4) AS rank_score,
    RANK() OVER (ORDER BY rating DESC, num_reviews DESC) AS rank
  FROM filtered_products
)


-- RERANKING and FINAL OUTPUT: Top 20 ranked products
SELECT 
  product_id,
  name,
  price,
  rating,
  num_reviews,
  rank_score,
  rank
FROM ranked_products
ORDER BY rank_score DESC
LIMIT 20;