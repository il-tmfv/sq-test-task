json.offers @offers do |offer|
  json.player_id offer.player_id
  json.product_id offer.product_id
  json.price offer.price
  json.quantity offer.quantity
end