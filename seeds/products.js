
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('products').del()
    .then(function () {
      // Inserts seed entries
      return knex('products').insert([
        {id: 1, sku: 'ref1', name: 'Product 1', price: 14.00, description: 'My beautifull product!'},
        {id: 2, sku: 'ref2', name: 'Product 2', price: 10.00, description: 'Maybe the revolution!'},
        {id: 3, sku: 'ref3', name: 'Product 3', price: 7.50, description: 'What?'},
        {id: 4, sku: 'ref4', name: 'Product 4', price: 20.00, description: 'I like this!'}
      ]);
    });
};
