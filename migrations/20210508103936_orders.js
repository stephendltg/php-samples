/**
 * Table for order
 */

 exports.up = function(knex) {
    return knex.schema.createTable('orders', t => {
        t.increments('id').primary().unsigned()
        t.bigInteger('author').unsigned().defaultTo(0)
        // t.text('meta', 'longtext')
        t.json('meta').nullable()
        t.text('title', 'text').notNullable()
        t.text('excerpt', 'text')
        t.string('post_status', 20).defaultTo('publish')
        t.string('post_name', 200)   // media: filename, post: name, views: name for search
        t.string('guid', 255) // path file or other
        t.string('post_type', 20).notNullable().defaultTo('post') // type: [media, posts, views, etc...]
        t.string('post_mime_type', 100) // for media
        t.timestamp('post_date').defaultTo(knex.fn.now())
        t.timestamp('post_modified').defaultTo(knex.fn.now())
    })
};

exports.down = function(knex) {
    return knex.schema.dropTable('orders')
};