<template>
  <v-container>
    <h1>Foods</h1>
    <product-list :products="allFoods"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "PadThai",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allPadThai"); //action; commit -> mutation
  },
  computed: {
    allFoods() {
      return this.$store.getters.allPadThai;
    }
  }
};
</script>
