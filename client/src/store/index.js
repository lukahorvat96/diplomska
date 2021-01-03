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
  ALL_BEERS,
  CHANGE_QUANTITY_CART,
  ALL_DRINKS_TYPE,
  ALL_DRINKS_BY_TYPE,
  SET_TYPE_ID
} from "./mutation-types";

export default new Vuex.Store({
  state: {
    drinks: [],
    foods: [],
    beers: [],
    cocktails: [],
    cart_drink: [],
    cart_food: [],
    drinksType: [],
    drinksTypeID: 0,
    drinksByType: [],
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
    [ALL_BEERS](state, payload) {
      state.beers = payload;
    },
    [ALL_DRINKTYPE](state, payload) {
      state.drinksInType = payload;
    },
    [ALL_DRINKS_TYPE](state, payload) {
      state.drinksType = payload;
    },
    [SET_TYPE_ID](state, payload) {
      state.drinksTypeID = payload;
    },
    [ALL_DRINKS_BY_TYPE](state, payload) {
      state.drinksByType = payload;
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
    allCocktails({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/cocktails`).then(response => {
        console.log(response.data);
        commit("ALL_COCKTAILS", response.data);
      });
    },
    allBeers({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/beers`).then(response => {
        console.log(response.data);
        commit("ALL_BEERS", response.data);
      });
    },
    allFoods({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/foods`).then(response => {
        //console.log(response.data)
        commit("ALL_FOODS", response.data);
      });
    },
    addOrderDrink({ commit }, payload) {
      axios
        .post(`${"http://192.168.1.13:5000"}/addorder/1`, payload)
        .then(response => {
          console.log(response.data);
          commit("ADD_ORDER_SUCCESS", response.data);
        });
      //axios.post(`${'http://192.168.1.13:5000'}/ /1`, payload).then(response => {
      //  commit(ADD_ORDER_SUCCESS, response.data)
      //})
    },
    allDrinksType({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/drinkstype`).then(response => {
        //console.log(response.data)
        commit("ALL_DRINKS_TYPE", response.data);
      });
    },
    allDrinksTypeById({ commit }, payload) {
      commit("SET_TYPE_ID", payload);
      console.log("PAYLOAD:" +payload);
      axios
        .get(`${"http://192.168.1.13:5000"}/drinkstype/` + payload)
        .then(response => {
          commit("ALL_DRINKS_BY_TYPE", response.data);
        });
    }
  },
  getters: {
    allDrinks: state => {
      return state.drinks;
    },
    allInDrinkType: state => {
      return state.drinksType;
    },
    allDrinksByType: state => {
      return state.drinksByType;
    },
    allCocktails: state => {
      return state.cocktails;
    },
    allBeers: state => {
      return state.beers;
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
