### products section

Product.delete_all

products = ConfigProvider.instance.products

products.each_key { |k|
  Product.create!(
      title: k, 
      price: products[k]['price'], 
      required_level: products[k]['required_level']
  )
}

### players & their storages section

Player.delete_all

players_count = 10
storage_capacity = ConfigProvider.instance.capacity

players_count.times { |i|
  player = Player.create!(
      name: "Player##{i}",
      level: rand(0..10),
      exp: rand(0.0..1.0).round(1),
      balance: rand(10.0..110.0).round(1)
  )
  
  player.storage = Storage.create!(capacity: storage_capacity)
}

### filling up users storages 

Player.all.each { |player|
  StorageProduct.create!(
      storage_id: player.storage.id,
      product_id: Product.all.sample.id,
      quantity: rand(1...storage_capacity)
  )
}