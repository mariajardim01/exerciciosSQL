SELECT products.*, categories."name" AS category 
FROM products 
JOIN categories
ON products."categoryId" = categories."id";