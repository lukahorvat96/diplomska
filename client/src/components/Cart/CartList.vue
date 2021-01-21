<template>
  <v-container grid-list-xs>
    <v-row v-for="(row, i) in itemsInCart" :key="i" row wrap>
      <v-col class="example" v-for="item in row" :key="item.id" :cols="cols">
        <cart-detail :drink="item"></cart-detail>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// import CartDetail from "./CartDetail";
import DrinkButton from "../Drinks/DrinkDetail.vue"
export default {
  name: "CartList",
  props: {
    items: {
      type: Array,
      required: true
    }
  },
  computed: {
    itemsInCart: function() {
      return this.items.reduce((acc, el, i) => {
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
    "cart-detail": DrinkButton
  }
};
</script>

<style lang="scss" scoped>
.example {
  padding-right: 10px;
}
</style>
