**Тестовое задание для SQ** – ***Модель рынка***

##### Postman
Файл с тестовыми запросами для Postman - `SQ-test.postman_collection.json`

##### Accept / Content-Type
`application/json`

##### Routes
- Получить данные рынка - `GET localhost:3000/offers`
- Получить данные игрока - `GET localhost:3000/players/:id`
- Выставить товар на рынок - `POST localhost:3000/offers`
Пример тела запроса: 
```js
{
	"product_id": 14,
	"player_id": 34,
	"price": 5.0,
	"quantity": 2
}
```
- Купить товар с рынка - `POST localhost:3000/players/:buyer_id/buy/:offer_id`
