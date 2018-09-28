import Vue from 'vue';
import VueRouter from 'vue-router';
import App from './components/app.vue';
import Routes from './routes.js';
import Store from './store';

Vue.use(VueRouter);

const app = new Vue({
    el: "#app",
    render: (h) => h(App),
    router: Routes,
    store: Store
});

