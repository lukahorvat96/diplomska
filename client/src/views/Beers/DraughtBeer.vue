<template>
  <v-container>
    <h1>Draught Beers</h1>
    <drink-list :drinks="allDraughtBeers"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "DraughtBeer",
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allDraughtBeers"); //action; commit -> mutation
  },
  computed: {
    allDraughtBeers() {
      return this.$store.getters.allDraughtBeers;
    }
  }
};
</script>
