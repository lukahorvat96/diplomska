<template>
  <v-container>
    <h1>{{ this.drinkTypeName }} : {{ drinkTypeID }}</h1>
    <drink-list :drinks="allDrinksByType"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "DrinkType",
  props: {
    drinkTypeID: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      drinkTypeName: ""
    }
  },
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allDrinks");
  },
  computed: {
    allDrinksByType() {
      return this.getDrinksByTypeID();
    }
  },
  methods: {
    getDrinksByTypeID(){
      var allDrinks = this.$store.getters.allDrinks;
      var allDrinksType = this.$store.state.drinksType;
      var thisDrinks = [];
      for (var i = 0; i < allDrinksType.length; i++)
        if (allDrinksType[i].drinkType_id == this.drinkTypeID)
          this.drinkTypeName=allDrinksType[i].name;
      for (i = 0; i < allDrinks.length; i++)
        if (allDrinks[i].type_id == this.drinkTypeID)
          thisDrinks.push(allDrinks[i]);
      return thisDrinks;
    }
  }
};
</script>
