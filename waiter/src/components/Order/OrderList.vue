<template>
  <v-container grid-list-xs>
    <v-row v-for="(row, i) in ordersInCart" :key="i" row wrap>
      <v-col class="example" v-for="order in row" :key="order.id" :cols="cols">
        <order-detail :order="order"></order-detail>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import OrderDetail from "./OrderDetail";
export default {
  name: "OrderList",
  props: {
    orders: {
      type: Array,
      required: true
    }
  },
  computed: {
    ordersInCart: function() {
      return this.orders.reduce((acc, el, i) => {
        if (i % this.colsNum === 0) {
          acc.push([el]);
        } else {
          acc[acc.length - 1].push(el);
        }
        return acc;
      }, []);
    },
    cols: function() {
      return 12 / this.colsNum;
    }
  },
  data() {
    return {
      colsNum: 2
    };
  },
  components: {
    "order-detail": OrderDetail
  }
};
</script>

<style lang="scss" scoped>
.example {
  padding-right: 10px;
}
</style>
