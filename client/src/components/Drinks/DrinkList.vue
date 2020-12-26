<template>
  <v-container grid-list-xs>
    <v-row v-for="(row, i) in items" :key="i" row wrap>
      <v-col class="example" v-for="drink in row" :key="drink.id" :cols="cols">
        <drink-detail :drink="drink"></drink-detail>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import DrinkDetail from "@/components/Drinks/DrinkDetail.vue";
export default {
  name: "DrinkList",
  props: {
    drinks: {
      type: Array,
      required: true
    }
  },
  computed: {
    items: function() {
      return this.drinks.reduce((acc, el, i) => {
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
    "drink-detail": DrinkDetail
  }
};
</script>

<style lang="scss" scoped>
.example {
  padding-right: 10px;
}
</style>
