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


