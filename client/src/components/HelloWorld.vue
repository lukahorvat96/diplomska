<template>
  <v-container class="action">
    <v-row class="text-center">
      <v-col>
        <v-img
          :src="require('../assets/Untitled-2.png')"
          contain
          height="900"
        />
      </v-col>

      <!-- <v-col >
        <h1 class="display-2 font-weight-bold ">
          Welcome to asd
        </h1>
        <v-btn color="red">
          explorer
        </v-btn>
      </v-col> -->
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "HelloWorld",

  data: () => ({
    ecosystem: [
      {
        text: "vuetify-loader",
        href: "https://github.com/vuetifyjs/vuetify-loader"
      },
      {
        text: "github",
        href: "https://github.com/vuetifyjs/vuetify"
      },
      {
        text: "awesome-vuetify",
        href: "https://github.com/vuetifyjs/awesome-vuetify"
      }
    ],
    importantLinks: [
      {
        text: "Documentation",
        href: "https://vuetifyjs.com"
      },
      {
        text: "Chat",
        href: "https://community.vuetifyjs.com"
      },
      {
        text: "Made with Vuetify",
        href: "https://madewithvuejs.com/vuetify"
      },
      {
        text: "Twitter",
        href: "https://twitter.com/vuetifyjs"
      },
      {
        text: "Articles",
        href: "https://medium.com/vuetify"
      }
    ],
    whatsNext: [
      {
        text: "Explore components",
        href: "https://vuetifyjs.com/components/api-explorer"
      },
      {
        text: "Select a layout",
        href: "https://vuetifyjs.com/layout/pre-defined"
      },
      {
        text: "Frequently Asked Questions",
        href: "https://vuetifyjs.com/getting-started/frequently-asked-questions"
      }
    ]
  })
};
</script>
<style>
/* #wrapper {
  width: auto;
  height: auto;
  background-color: rgb(243, 243, 243);
  background-image: url(https://adventuresincooking.com/wp-content/uploads/2016/08/Greek-Salad-by-Eva-Kosmas-Flores-5.jpg);
  /* margin: 0 auto;
  margin-top: 200px;
  border-radius: 10px; 
}  */
.action {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 90vh;
}
</style>
