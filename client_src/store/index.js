import Vue from 'vue';
import Vuex from 'vuex';
import NewCaseStore from './modules/new_use_case';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        NewCaseStore
    }
});