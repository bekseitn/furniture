Product.delete_all
Product.create! id: 1, name: "Banana", price: 310, active: true
Product.create! id: 2, name: "Apple", price: 200, active: true
Product.create! id: 3, name: "Carton of Strawberries", price: 100, active: true

Category.delete_all
Category.create!([
        {name: "Банкетки"},
        {name: "Диван для отдыха в положении сидя"},
        {name: "Диван-кровать"},
        {name: "Диван-софа"},
        {name: "Диваны"},
        {name: "Диваны и кресла"},
        {name: "Диваны угловые"},
        {name: "Кресла"},
        {name: "Кресла-мешки"},
        {name: "Кухонные уголки"},
        {name: "Кухонный диван"},
        {name: "Кушетки"},
        {name: "Подлокотник"},
        {name: "Стулья"},
])

OrderStatus.delete_all
OrderStatus.create!([
  {id: 1, name: "In Progress"},
  {id: 2, name: "Placed"},
  {id: 3, name: "Shipped"},
  {id: 4, name: "Cancelled"}
])


