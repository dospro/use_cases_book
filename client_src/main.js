import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuex from 'vuex';
import App from './components/app.vue';
import Routes from './routes.js';

Vue.use(VueRouter);
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        name: 'TestName'
    },
    mutations: {
        changeName: (state, newName) => {
            console.log("Changing name to %o", newName);
            state.name = newName;
        }
    }
});

const app = new Vue({
    el: "#app",
    render: (h) => h(App),
    router: Routes,
    store: store
});

