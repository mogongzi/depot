require("@rails/ujs").start();
require("turbolinks").start();
require("jquery");
// require("@rails/activestorage").start();
// require("channels");
// import all scss files
import "../scss/application.scss"
import "../scss/admin.scss"
import "../scss/carts.scss"
import "../scss/line_items.scss"
import "../scss/orders.scss"
import "../scss/products.scss"
import "../scss/scaffolds.scss"
import "../scss/sessions.scss"
import "../scss/store.scss"
import "../scss/users.scss"
// import all images
require.context('../images', true);
