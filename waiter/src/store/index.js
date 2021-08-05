import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);
import {
  ADD_TO_CART,
  DELETE_FROM_CART,
  ADD_ORDER,
  ADD_ORDER_SUCCESS,
  CHANGE_QUANTITY_CART,
  ALL_ORDERS,
  ORDER_BY_ID,
  NEW_ORDER,
  CHECK_LOGIN,
  LOGOUT,
  CLEAR_ORDERS
} from "./mutation-types";

export default new Vuex.Store({
  state: {
    table_details: [
      {
        table_id: 1,
        table_name: "Miza 1"
      }
    ],
    order_complete: false,
    response: "",
    loading: false,
    orders: [],
    ordersFood: [],
    orderById: [],
    newOrder: null,
    isLogin: false,
    loginMessege: null,
    loginUsername: "",
    loginUsernameID: null,
    isWaiter: false,
    isCooker: false,
    ordersDone: 0
  },
  mutations: {
    [ADD_TO_CART](state, payload) {
      const index = state.orderById.findIndex(
        p => p.product_id === payload.product_id
      );
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
    [ALL_ORDERS](state, payload) {
      state.orders = payload["orders"];
      state.ordersFood = payload["ordersfood"];
    },
    [CLEAR_ORDERS](state) {
      state.orders = [];
      state.ordersFood = [];
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
        if (payload["result"] == "Cook") {
          state.isCooker = true;
          state.loginMessege = "cook";
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
      state.ordersDone = 0;
    }
  },
  actions: {
    allOrdersWithoutEnd({ commit, state }) {
      axios
        .get(
          `${"http://192.168.1.13:5000"}/ordersWithoutEnd/` +
            state.loginUsernameID
        )
        .then(response => {
          commit("ALL_ORDERS", response.data);
        });
    },
    allOrdersProductById({ commit }, payload) {
      axios
        .get(`${"http://192.168.1.13:5000"}/orders/` + payload)
        .then(response => {
          commit("ORDER_BY_ID", response.data);
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
    updateOrderCookStatus({ commit }, payload) {
      commit("ADD_ORDER");
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
      const latest = {
        user_id: state.loginUsernameID
      };
      axios
        .post(`${"http://192.168.1.13:5000"}/endorder/` + payload, latest)
        .then(response => {
          console.log(response.data);
        });
      state.ordersDone += 1;
      commit("CLEAR_ORDERS");
    },
    checkLogin({ commit }, payload) {
      commit("ADD_ORDER");
      axios
        .post(`${"http://192.168.1.13:5000"}/login`, payload)
        .then(response => {
          commit("CHECK_LOGIN", response.data);
        });
    },
    logoutUser({ commit }) {
      commit("ADD_ORDER");
      axios.get(`${"http://192.168.1.13:5000"}/logout`);
    },
    updateOrderProductById({ commit, state }, orderID) {
      commit("ADD_ORDER");
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
      commit("NEW_ORDER", payload);
    },
    SOCKET_checkDatabesOrders({ dispatch }) {
      dispatch("allOrdersWithoutEnd");
    },
    SOCKET_orderEnd({ dispatch }) {
      dispatch("allOrdersWithoutEnd");
    },
    SOCKET_orderChanged({ dispatch }) {
      dispatch("allOrdersWithoutEnd");
    }
  },
  getters: {
    orderResponse: state => {
      return state.response;
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
        if (state.orderById[i].type_id < 15) {
          order_drinks.push(state.orderById[i]);
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
    },
    getOrdersDone: state => {
      return state.ordersDone;
    }
  }
});
