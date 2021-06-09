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
  ALL_BOTTLED_BEERS,
  CHANGE_QUANTITY_CART,
  ALL_DRAUGHT_BEERS,
  ALL_CIDER,
  SET_DATA,
  ALL_WINE,
  ALL_STARTER,
  ALL_SOUP,
  ALL_SALAD,
  ALL_PASTA,
  ALL_RISSOTO,
  ALL_PIZZA,
  ALL_MEAT,
  ALL_PADTHAI,
  ALL_HOTDRINK,
  ALL_BOTTLEDBEVERAGE,
  ALL_NATURALBEVERAGE,
  ALL_GIN,
  ALL_VODKA,
  SET_ORDER_STATUS,
  CHANGED_ORDER,
  CLEAR_ALL
} from "./mutation-types";

export default new Vuex.Store({
  state: {
    table_details: [
      {
        table_id: 1,
        table_name: "Miza 1"
      }
    ],
    drinks: [],
    bottledbeer: [],
    draughtBeers: [],
    cider: [],
    wine: [],
    hotDrink: [],
    bottledBeverage: [],
    naturalBeverage: [],
    gin: [],
    vodka: [],
    foods: [],
    starter: [],
    soup: [],
    salad: [],
    pasta: [],
    rissoto: [],
    pizza: [],
    meat: [],
    padthai: [],
    cart_product: [],
    loading: false,
    someData: null,
    orderID: null,
    totalPrice: 0,
    orderPlaced: false,
    orderStatus: "",
    orderEnd: false
  },
  mutations: {
    [ALL_DRINKS](state, payload) {
      state.drinks = payload;
      state.drinks.sort((t1, t2) => (t1.name < t2.name ? -1 : 1));
    },
    [ALL_FOODS](state, payload) {
      state.foods = payload;
      //state.foods.sort((t1, t2) => (t1.name < t2.name ? -1 : 1));
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
    [ALL_WINE](state, payload) {
      state.wine = payload;
    },
    [ALL_HOTDRINK](state, payload) {
      state.hotDrink = payload;
    },
    [ALL_BOTTLEDBEVERAGE](state, payload) {
      state.bottledBeverage = payload;
    },
    [ALL_NATURALBEVERAGE](state, payload) {
      state.naturalBeverage = payload;
    },
    [ALL_GIN](state, payload) {
      state.gin = payload;
    },
    [ALL_VODKA](state, payload) {
      state.vodka = payload;
    },
    [ALL_STARTER](state, payload) {
      state.starter = payload;
    },
    [ALL_SOUP](state, payload) {
      state.soup = payload;
    },
    [ALL_SALAD](state, payload) {
      state.salad = payload;
    },
    [ALL_PASTA](state, payload) {
      state.pasta = payload;
    },
    [ALL_RISSOTO](state, payload) {
      state.rissoto = payload;
    },
    [ALL_PIZZA](state, payload) {
      state.pizza = payload;
    },
    [ALL_MEAT](state, payload) {
      state.meat = payload;
    },
    [ALL_PADTHAI](state, payload) {
      state.padthai = payload;
    },
    [SET_ORDER_STATUS](state, payload) {
      state.orderStatus = payload;
    },
    [CHANGED_ORDER](state, payload) {
      var totalPrice = 0;
      for (var i = 0; i < payload.length; i++)
        totalPrice += payload[i].quantity * payload[i].price;
      state.cart_product = payload;
      state.totalPrice = totalPrice;
    },
    [ADD_TO_CART](state, payload) {
      const index = state.cart_product.findIndex(
        p => p.product_id === payload.product_id
      );
      console.log("INDEX V BAZI: " + index);
      if (index == -1) state.cart_product.push(payload);
      if (index != -1) {
        Vue.set(state.cart_product, index, payload);
      }
    },
    [DELETE_FROM_CART](state, payload) {
      const index = state.cart_product.findIndex(p => p.product_id === payload);
      state.cart_product.splice(index, 1);
    },
    [CHANGE_QUANTITY_CART](state, payload) {
      const index = state.cart_product.findIndex(
        p => p.product_id === payload[0]
      );
      state.cart_product[index].quantity = payload[1];
      state.cart_product[index].totalPrice = payload[2];
    },
    [ADD_ORDER](state) {
      state.loading = true;
    },
    [ADD_ORDER_SUCCESS](state, payload) {
      state.orderPlaced = true;
      state.orderID = payload;
    },
    [CLEAR_CART](state) {
      state.cart_product = [];
    },
    [SET_DATA](state, payload) {
      state.someData = payload;
    },
    [CLEAR_ALL](state) {
      state.cart_product = [];
      state.someData = null;
      state.totalPrice = 0;
      state.orderPlaced = false;
    }
  },
  actions: {
    allDrinks({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/drinks`).then(response => {
        commit("ALL_DRINKS", response.data);
      });
    },
    allFoods({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/foods`).then(response => {
        commit("ALL_FOODS", response.data);
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
    allWine({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/wine`).then(response => {
        console.log(response.data);
        commit("ALL_WINE", response.data);
      });
    },
    allHotDrinks({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/hotdrink`).then(response => {
        console.log(response.data);
        commit("ALL_HOTDRINK", response.data);
      });
    },
    allBottledBeverages({ commit }) {
      axios
        .get(`${"http://192.168.1.13:5000"}/bottledbeverage`)
        .then(response => {
          console.log(response.data);
          commit("ALL_BOTTLEDBEVERAGE", response.data);
        });
    },
    allNaturalBeverages({ commit }) {
      axios
        .get(`${"http://192.168.1.13:5000"}/naturalbeverage`)
        .then(response => {
          console.log(response.data);
          commit("ALL_NATURALBEVERAGE", response.data);
        });
    },
    allGin({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/gin`).then(response => {
        console.log(response.data);
        commit("ALL_GIN", response.data);
      });
    },
    allVodka({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/vodka`).then(response => {
        console.log(response.data);
        commit("ALL_VODKA", response.data);
      });
    },
    allStarters({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/starter`).then(response => {
        console.log(response.data);
        commit("ALL_STARTER", response.data);
      });
    },
    allSoups({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/soup`).then(response => {
        console.log(response.data);
        commit("ALL_SOUP", response.data);
      });
    },
    allSalads({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/salad`).then(response => {
        console.log(response.data);
        commit("ALL_SALAD", response.data);
      });
    },
    allPasta({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/pasta`).then(response => {
        console.log(response.data);
        commit("ALL_PASTA", response.data);
      });
    },
    allRissoto({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/rissoto`).then(response => {
        console.log(response.data);
        commit("ALL_RISSOTO", response.data);
      });
    },
    allPizzas({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/pizza`).then(response => {
        console.log(response.data);
        commit("ALL_PIZZA", response.data);
      });
    },
    allMeat({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/meat`).then(response => {
        console.log(response.data);
        commit("ALL_MEAT", response.data);
      });
    },
    allPadThai({ commit }) {
      axios.get(`${"http://192.168.1.13:5000"}/padthai`).then(response => {
        console.log(response.data);
        commit("ALL_PADTHAI", response.data);
      });
    },
    addOrder({ commit, state }, payload) {
      commit("ADD_ORDER");
      axios
        .post(
          `${"http://192.168.1.13:5000"}/addorder/` +
            state.table_details[0]["table_id"],
          payload
        )
        .then(response => {
          console.log(response.data);
          commit("ADD_ORDER_SUCCESS", response.data);
        });
      // commit("CLEAR_CART");
      //axios.post(`${'http://192.168.1.13:5000'}/ /1`, payload).then(response => {
      //  commit(ADD_ORDER_SUCCESS, response.data)
      //}),
      commit("SET_ORDER_STATUS", "PLACED BY CLIENT");
    },
    addOrderOnCall({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(`${"http://192.168.1.13:5000"}/addorderoncall/1`, payload)
        .then(response => {
          console.log(response.data);
          commit("ADD_ORDER_SUCCESS", response.data);
        });
      commit("SET_ORDER_STATUS", "CALLING WAITER");
    },
    orderStatus({ commit, state }) {
      commit("ADD_ORDER");
      axios
        .get(`${"http://192.168.1.13:5000"}/order/` + state.orderID)
        .then(response => {
          console.log(response.data);
          commit("SET_ORDER_STATUS", response.data);
        });
    },
    updateOrderDrink({ commit, state }, payload) {
      commit("ADD_ORDER");
      axios
        .post(
          `${"http://192.168.1.13:5000"}/updateorder/` + state.orderID,
          payload
        )
        .then(response => {
          console.log(response.data);
        });
      commit("SET_ORDER_STATUS", "UPDATED ORDER");
    },
    checkOrder({ commit, state }) {
      //prejem spremeb iz baze zaradi srpemeb na strani natakarja
      commit("ADD_ORDER");
      axios
        .get(`${"http://192.168.1.13:5000"}/orders/` + state.orderID)
        .then(response => {
          console.log(response.data);
          commit("CHANGED_ORDER", response.data);
        });
    },
    updateOrderStatus({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(
          `${"http://192.168.1.13:5000"}/updateorderstatus/` +
            payload["order_id"],
          payload
        )
        .then(response => {
          console.log(response.data);
        });
    },
    finishOrder({ commit, state }, payload) {
      commit("ADD_ORDER");
      //payment option
      axios
        .post(
          `${"http://192.168.1.13:5000"}/finishorder/` + state.orderID,
          payload
        )
        .then(response => {
          console.log(response.data);
        });
      state.orderEnd = true;
      commit("CLEAR_ALL");
      commit("SET_ORDER_STATUS", "WAITING FOR INVOICE");
    },
    "SOCKET_my response"({ commit }, payload) {
      commit("SET_DATA", payload);
    },
    SOCKET_CONFIRMED({ commit, state }, payload) {
      if (payload == state.orderID)
        commit("SET_ORDER_STATUS", "CONFIRMED BY WAITER");
    },
    SOCKET_SERVED({ commit, state }, payload) {
      if (payload == state.orderID) commit("SET_ORDER_STATUS", "SERVED");
    },
    SOCKET_CALLING_WAITER({ commit, state }, payload) {
      if (payload == state.orderID)
        commit("SET_ORDER_STATUS", "CALLING WAITER");
    },
    SOCKET_orderChanged({ commit, dispatch, state }, payload) {
      if (payload == state.orderID) {
        commit("SET_ORDER_STATUS", "CHANGED BY WAITER");
        dispatch("checkOrder");
      }
    },
    SOCKET_orderEnd({ commit, state }, payload) {
      console.log("orderENDD!!!");
      if (payload == state.orderID) {
        commit("CLEAR_ALL");
        commit("SET_ORDER_STATUS", "ORDER_END");
        state.orderID = null;
        state.orderEnd = false;
      }
    }
  },
  getters: {
    allDrinks: state => {
      return state.drinks;
    },
    allFoods: state => {
      return state.foods;
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
    allWine: state => {
      return state.wine;
    },
    allHotDrinks: state => {
      return state.hotDrink;
    },
    allBottledBeverages: state => {
      return state.bottledBeverage;
    },
    allNaturalBeverages: state => {
      return state.naturalBeverage;
    },
    allGin: state => {
      return state.gin;
    },
    allVodka: state => {
      return state.vodka;
    },
    allStarters: state => {
      return state.starter;
    },
    allSoups: state => {
      return state.soup;
    },
    allSalads: state => {
      return state.salad;
    },
    allPasta: state => {
      return state.pasta;
    },
    allRissoto: state => {
      return state.rissoto;
    },
    allPizzas: state => {
      return state.pizza;
    },
    allMeat: state => {
      return state.meat;
    },
    allPadThai: state => {
      return state.padthai;
    },
    allCardProducts: state => {
      return state.cart_product;
    },
    orderResponse: state => {
      return state.response;
    },
    allProductsInCart: state => {
      return state.cart_product;
    },
    // getDrinkCartQuantity: (state, getters) => {
    //   return state.cart_product.findIndex(p => p.product_id === getters);
    // },
    getSomeData: state => {
      return state.someData;
    },
    getOrderID: state => {
      return state.orderID;
    },
    getTotalPrice: state => {
      if (state.orderEnd == true) return 0;
      return state.totalPrice;
    },
    allFoodsInCart: state => {
      var cart_foods = [];
      for (var i = 0; i < state.cart_product.length; i++)
        if (state.cart_product[i].type_id >= 15)
          cart_foods.push(state.cart_product[i]);
      return cart_foods;
    },
    allDrinksInCart: state => {
      var cart_drinks = [];
      for (var i = 0; i < state.cart_product.length; i++)
        if (state.cart_product[i].type_id < 15)
          cart_drinks.push(state.cart_product[i]);
      return cart_drinks;
    },
    getOrderStatus: state => {
      return state.orderStatus;
    },
    getTableID: state => {
      return state.table_details[0]["table_id"];
    },
    getTableName: state => {
      return state.table_details[0]["table_name"];
    }
  }
});
