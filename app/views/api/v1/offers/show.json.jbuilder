json.offer do
  json.id @offer.id
  json.price @offer.price
  json.quantity @offer.quantity
  json.product do
    json.id @offer.product.id
    json.title @offer.product.title
    json.original_price @offer.product.price
    json.required_level @offer.product.required_level
  end
  json.player do
    json.id @offer.player.id
    json.name @offer.player.name
    json.level @offer.player.level
  end
end
