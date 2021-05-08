
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('customers').del()
    .then(function () {
      // Inserts seed entries
      return knex('customers').insert([
        {id: 1, firstname: 'John', lastname: 'Dow', email: 'john.down@yoonest.com'},
        {id: 2, firstname: 'Walter', lastname: 'White', email: 'walter.white@yoonest.com'},
        {id: 3, firstname: 'John', lastname: 'Snow', email: 'john.snow@yoonest.com'},
      ]);
    });
};
