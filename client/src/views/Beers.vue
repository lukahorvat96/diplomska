<template>
  <v-container>
    <h1>BEERS</h1>
    <drink-list :drinks="allBeers"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "drink",
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allBeers"); //action; commit -> mutation
  },
  computed: {
    allBeers() {
      return this.$store.getters.allBeers;
    }
  }
};
</script>
