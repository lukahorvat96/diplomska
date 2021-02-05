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
  ALL_ORDERS,
  ORDER_BY_ID,
  NEW_ORDER,
  CHECK_LOGIN,
  LOGOUT
} from "./mutation-types";

export default new Vuex.Store({
  state: {
    drinks: [],
    foods: [],
    beers: [],
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
    drinksInType: [],
    orders: [],
    ordersFood: [],
    orderById: [],
    newOrder: null,
    isLogin: false,
    loginMessege: null,
    loginUsername: "",
    loginUsernameID: null,
    isWaiter: false,
    isCooker: false
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
    [REQUEST_DRINKTYPE](state, payload) {
      state.drinkTypeRequest = payload;
    },
    [ALL_FOODS](state, payload) {
      state.drinks = payload;
    },
    [ADD_TO_CART](state, payload) {
      const index = state.orderById.findIndex(
        p => p.product_id === payload.product_id
      );
      console.log("INDEX V BAZI: " + index);
      if (index == -1) state.orderById.push(payload);
      if (index != -1) {
        Vue.set(state.orderById, index, payload);
      }
    },
    [DELETE_FROM_CART](state, payload) {
      const index = state.orderById.findIndex(p => p.product_id === payload);
      state.orderById.splice(index, 1);
    },
    [CHANGE_QUANTITY_CART](state, payload) {
      const index = state.orderById.findIndex(p => p.product_id === payload[0]);
      state.orderById[index].quantity = payload[1];
      state.orderById[index].totalPrice = payload[2];
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
    },
    [ALL_ORDERS](state, payload) {
      state.orders = payload["orders"];
      state.ordersFood = payload["ordersfood"];
    },
    [ORDER_BY_ID](state, payload) {
      state.orderById = [];
      state.orderById = payload;
    },
    [NEW_ORDER](state, payload) {
      state.newOrder = payload;
    },
    [CHECK_LOGIN](state, payload) {
      if (payload["result"] != "False") {
        state.isLogin = true;
        state.loginMessege = "Correct username and password.";
        if (payload["result"] == "Waiter") {
          state.isWaiter = true;
          state.loginMessege = "waiter";
          state.loginUsername = payload["username"];
          state.loginUsernameID = payload["user_id"];
        }
        if (payload["result"] == "Cooker") {
          state.isCooker = true;
          state.loginMessege = "cooker";
          state.loginUsername = payload["username"];
          state.loginUsernameID = payload["user_id"];
        }
      } else state.loginMessege = "Login failed. Check username and password.";
    },
    [LOGOUT](state) {
      state.isLogin = false;
      state.loginMessege = null;
      state.isWaiter = false;
      state.isCooker = false;
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
    addOrder({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(`${"http://192.168.1.13:5000"}/addorder/1`, payload)
        .then(response => {
          commit("ADD_ORDER_SUCCESS", response.data);
        });
      //axios.post(`${'http://192.168.1.13:5000'}/ /1`, payload).then(response => {
      //  commit(ADD_ORDER_SUCCESS, response.data)
      //})
    },
    allOrdersWithoutEnd({ commit }) {
      axios
        .get(`${"http://192.168.1.13:5000"}/ordersWithoutEnd`)
        .then(response => {
          commit("ALL_ORDERS", response.data);
        });
    },
    // allOrdersFoodWithoutEnd({ commit }) {
    //   axios
    //     .get(`${"http://192.168.1.13:5000"}/ordersFoodWithoutEnd`)
    //     .then(response => {
    //       commit("ALL_ORDERS_FOOD", response.data);
    //     });
    // },
    allOrdersProductById({ commit }, payload) {
      axios
        .get(`${"http://192.168.1.13:5000"}/orders/` + payload)
        .then(response => {
          commit("ORDER_BY_ID", response.data);
        });
    },
    updateOrderStatus({ commit }, payload) {
      commit("ADD_ORDER");
      console.log(payload)
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
    updateOrderCookStatus({ commit }, payload) {
      commit("ADD_ORDER");
      console.log("updatinggggg")
      axios
        .post(
          `${"http://192.168.1.13:5000"}/updateordercookstatus/` +
            payload["order_id"],
          payload
        )
        .then(response => {
          console.log(response.data);
        });
    },
    endOrder({ commit, state }, payload) {
      commit("ADD_ORDER");
      console.log("ORDER ID: " + payload);
      const latest = {
        user_id: state.loginUsernameID
      };
      axios
        .post(`${"http://192.168.1.13:5000"}/endorder/` + payload, latest)
        .then(response => {
          console.log(response.data);
        });
      // commit("CLEAR_CART");
      //axios.post(`${'http://192.168.1.13:5000'}/ /1`, payload).then(response => {
      //  commit(ADD_ORDER_SUCCESS, response.data)
      //}),
    },
    checkLogin({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(`${"http://192.168.1.13:5000"}/users`, payload)
        .then(response => {
          commit("CHECK_LOGIN", response.data);
        });
    },
    updateOrderProductById({ commit, state }, orderID) {
      commit("ADD_ORDER");
      console.log("ORDER ID: " + orderID);
      axios
        .post(
          `${"http://192.168.1.13:5000"}/updateorderwaiter/` + orderID,
          state.orderById
        )
        .then(response => {
          console.log(response.data);
        });
    },
    "SOCKET_my response"({ commit }, payload) {
      console.log("IZPIS IZ SOCEKT: " + payload);
      //dispatch("allOrdersWithoutEnd");
      commit("NEW_ORDER", payload);
    },
    SOCKET_checkDatabesOrders({ dispatch }) {
      console.log("SOCKET_checkDatabesOrders");
      dispatch("allOrdersWithoutEnd");
      // dispatch("allOrdersFoodWithoutEnd");
    },
    SOCKET_orderEnd({ dispatch }) {
      console.log("SOCKET_checkDatabesOrders");
      dispatch("allOrdersWithoutEnd");
      // dispatch("allOrdersFoodWithoutEnd");
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
    },
    getAllOrdersWithoutEnd: state => {
      return state.orders;
    },
    getAllOrdersFoodWithoutEnd: state => {
      return state.ordersFood;
    },
    allOrdersProductById: state => {
      return state.orderById;
    },
    allOrdersFoodsById: state => {
      var order_foods = [];
      for (var i = 0; i < state.orderById.length; i++)
        if (state.orderById[i].type_id >= 15)
          order_foods.push(state.orderById[i]);
      return order_foods;
    },
    allOrdersDrinksById: state => {
      var order_drinks = [];
      for (var i = 0; i < state.orderById.length; i++)
        if (state.orderById[i].type_id < 15){
          order_drinks.push(state.orderById[i]);
          console.log("state: " + state.orderById[i]);
        }
      return order_drinks;
    },
    totalPriceById: state => {
      var totalPrice = 0;
      for (var i = 0; i < state.orderById.length; i++)
        totalPrice += state.orderById[i].totalPrice;
      return totalPrice;
    },
    newOrderStatus: state => {
      return state.newOrder;
    },
    getIsLogin: state => {
      return state.isLogin;
    },
    loginMessage: state => {
      return state.loginMessege;
    },
    isWaiter: state => {
      return state.isWaiter;
    },
    isCooker: state => {
      return state.isCooker;
    },
    loginUsername: state => {
      return state.loginUsername;
    }
  }
});
