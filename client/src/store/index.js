import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);
import {
  ALL_DRINKS,
  ALL_FOODS,
  ADD_TO_CART,
  DELETE_FROM_CART,
  ADD_ORDER,
  ADD_ORDER_SUCCESS,
  CLEAR_CART,
  ALL_DRINKTYPE,
  REQUEST_DRINKTYPE,
  ALL_COCKTAILS,
  ALL_BOTTLED_BEERS,
  CHANGE_QUANTITY_CART,
  ALL_DRAUGHT_BEERS,
  ALL_CIDER
} from "./mutation-types";

export default new Vuex.Store({
  state: {
    drinks: [],
    foods: [],
    bottledbeer: [],
    draughtBeers: [],
    cider: [],
    cocktails: [],
    cart_drink: [],
    cart_food: [],
    table_details: [
      {
        table_id: 1,
        table_name: "Miza 1"
      }
    ],
    order_complete: false,
    response: "",
    loading: false,
    drinkTypeRequest: "",
    drinksInType: []
  },
  mutations: {
    [ALL_DRINKS](state, payload) {
      state.drinks = payload;
    },
    [ALL_COCKTAILS](state, payload) {
      state.cocktails = payload;
    },
    [ALL_BOTTLED_BEERS](state, payload) {
      state.bottledbeer = payload;
    },
    [ALL_DRAUGHT_BEERS](state, payload) {
      state.draughtBeers = payload;
    },
    [ALL_CIDER](state, payload) {
      state.cider = payload;
    },
    [ALL_DRINKTYPE](state, payload) {
      state.drinksInType = payload;
    },
    [REQUEST_DRINKTYPE](state, payload) {
      state.drinkTypeRequest = payload;
    },
    [ALL_FOODS](state, payload) {
      state.drinks = payload;
    },
    [ADD_TO_CART](state, payload) {
      state.cart_drink.push(payload);
    },
    [DELETE_FROM_CART](state, payload) {
      const index = state.cart_drink.findIndex(p => p.drink_id === payload);
      state.cart_drink.splice(index, 1);
    },
    [CHANGE_QUANTITY_CART](state, payload) {
      const index = state.cart_drink.findIndex(p => p.drink_id === payload[0]);
      state.cart_drink[index].quantity = payload[1];
      state.cart_drink[index].totalPrice = payload[2];
    },
    [ADD_ORDER](state) {
      state.loading = true;
    },
    [ADD_ORDER_SUCCESS](state, payload) {
      state.response = payload;
    },
    [CLEAR_CART](state) {
      state.cart_drink = [];
      state.cart_food = [];
    }
  },
  actions: {
    allDrinks({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/drinks`).then(response => {
        //console.log(response.data)
        commit("ALL_DRINKS", response.data);
      });
    },
    allInDrinkType({ commit }, type) {
      axios.get(`${"http://192.168.1.13:5000"}/` + type).then(response => {
        console.log(response.data);
        commit("ALL_DRINKTYPE", response.data);
      });
    },
    allCocktails({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/cocktails`).then(response => {
        console.log(response.data);
        commit("ALL_COCKTAILS", response.data);
      });
    },
    allBottledBeer({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/bottledbeer`).then(response => {
        console.log(response.data);
        commit("ALL_BOTTLED_BEERS", response.data);
      });
    },
    allDraughtBeers({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/draughtbeer`).then(response => {
        console.log(response.data);
        commit("ALL_DRAUGHT_BEERS", response.data);
      });
    },
    allCider({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/cider`).then(response => {
        console.log(response.data);
        commit("ALL_CIDER", response.data);
      });
    },
    allFoods({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/foods`).then(response => {
        //console.log(response.data)
        commit("ALL_FOODS", response.data);
      });
    },
    addOrderDrink({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(`${"http://192.168.1.13:5000"}/addorder/1`, payload)
        .then(response => {
          console.log(response.data);
          commit("ADD_ORDER_SUCCESS", response.data);
        });
      //axios.post(`${'http://192.168.1.13:5000'}/ /1`, payload).then(response => {
      //  commit(ADD_ORDER_SUCCESS, response.data)
      //})
    }
  },
  getters: {
    allDrinks: state => {
      return state.drinks;
    },
    allInDrinkType: state => {
      return state.drinksInType;
    },
    allCocktails: state => {
      return state.cocktails;
    },
    allBottledBeer: state => {
      return state.bottledbeer;
    },
    allDraughtBeers: state => {
      return state.draughtBeers;
    },
    allCider: state => {
      return state.cider;
    },
    allFoods: state => {
      return state.foods;
    },
    allCardDrinks: state => {
      return state.cart_drink;
    },
    orderResponse: state => {
      return state.response;
    },
    allDrinksInCart: state => {
      return state.cart_drink;
    },
    getDrinkCartQuantity: (state, getters) => {
      return state.cart_drink.findIndex(p => p.drink_id === getters);
    }
  }
});