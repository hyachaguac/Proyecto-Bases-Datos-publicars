-- Consultas Entrega Final Publicars

-- 1. La ciudad en donde mas se publica:
SELECT city.name_city as Nombre_Ciudad, count(payment.ad_id_ad) as Cantidad_Anuncios FROM city 
inner join ad on city.id_city = ad.city_id_city 
inner  join payment on payment.ad_id_ad= ad.id_ad 
group by Nombre_Ciudad ORDER BY Cantidad_Anuncios DESC limit 1;

-- Cantidad de anuncios por ciudad:
SELECT city.name_city as Nombre_Ciudad, count(ad_id_ad) as Cantidad_Anuncios FROM city 
inner join ad on city.id_city = ad.city_id_city 
inner  join payment on payment.ad_id_ad= ad.id_ad 
group by Nombre_Ciudad ORDER BY Cantidad_Anuncios DESC;


-- 2 La marca mas publicada:
SELECT brand.name_brand, count(ad.id_ad) AS Cantidad_de_anuncios FROM brand
INNER JOIN model ON brand.id_brand = model.brand_id_brand
INNER JOIN automobile ON model.id_model=automobile.model_id_model
INNER JOIN ad ON automobile.id_automobile=ad.automobile_id_automobile
GROUP BY brand.name_brand
ORDER BY Cantidad_de_anuncios DESC;

-- 3 Mostrar los 10 usuarios que más veces han publicado.
select user.first_name, user.last_name, count(user_id_user) as Quantity_ad 
from ad join user on user.id_user = ad.user_id_user 
group by id_user
order by Quantity_ad DESC limit 10;

-- 4 Ingresos totales generados por los anuncios
select (count(payment.ad_id_ad)*ad.price_ad) as Ingreso_total from payment 
inner join ad on payment.ad_id_ad = ad.id_ad;

-- 5 Promedio de publicaciones por año, desde la primera fecha de publicación hasta la última.

SELECT date_format(initial_date,'%Y') AS Año, avg(id_ad) AS Promedio 
			FROM ad WHERE date_format(initial_date,'%Y') < '2016-01-27' AND date_format(initial_date,'%Y') > '2010-02-03'  
			GROUP BY Año ORDER BY Año DESC;

-- 6 Mostrar ¿cuál ó cuáles son las ciudades con más carros a la venta?

select city.name_city as City, count(ad.automobile_id_automobile) as Total from automobile
inner join ad on automobile.id_automobile = ad.automobile_id_automobile
inner join city on ad.city_id_city = city.id_city
group by city.name_city having Total >= 40; 

-- 7 Mostrar el precio promedio de todos los carros por cada modelo.
select model.name_model, avg(automobile.price_automobile) as Average_price
from model, automobile 
where model.id_model = automobile.model_id_model
group by model.name_model;


