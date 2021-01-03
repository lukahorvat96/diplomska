<template>
  <v-container>
    <h1>BEERS</h1>
    <drink-list :drinks="allCider"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "Cider",
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allCider"); //action; commit -> mutation
  },
  computed: {
    allCider() {
      return this.$store.getters.allCider;
    }
  }
};
</script>
