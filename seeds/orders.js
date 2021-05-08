
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('orders').del()
    .then(function () {
      // Inserts seed entries
      return knex('orders').insert([
        {id: 1, customer: 1, status: "processing", price: 14.00, orderDate: "2019-09-02 17:02:53", cart: JSON.stringify([["ref1",{ name: "Product 1", quantity: 1, price: 14.00}]])},
        {id: 2, customer: 1, status: "processing", price: 40.00, orderDate: "2019-09-02 18:23:32", cart: JSON.stringify([["ref2",{ name: "Product 2", quantity: 1, price: 10.00}], ["ref3",{ name: "Product 3", quantity: 2, price: 15.00}]])},
        {id: 3, customer: 2, status: "processing", price: 120.00, orderDate: "2019-09-04 10:32:51", cart: JSON.stringify([["ref2",{ name: "Product 2", quantity: 10, price: 10.00}], ["ref4",{ name: "Product 4", quantity: 1, price: 20.00}]])},
        {id: 4, customer: 3, status: "Canceled", price: 14.00, orderDate: "2019-09-05 08:54:22", cart: JSON.stringify([["ref1",{ name: "Product 1", quantity: 1, price: 14.00}]])},
      ]);
    });
};
