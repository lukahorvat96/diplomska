<template>
  <v-container>
    <h1>FOODS</h1>
    <v-divider />
    <product-list :products="allFoods"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Food",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allFoods"); //action; commit -> mutation
  },
  computed: {
    allFoods() {
      return this.$store.getters.allFoods;
    }
  }
};
</script>
<style scoped>
h1 {
  margin-bottom: 2%;
  margin-left: 1%;
}
</style>