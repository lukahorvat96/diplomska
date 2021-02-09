<template>
  <div v-if="value">
    <v-dialog v-model="value" persistent width="500">
      <v-card>
        <v-card-title class="headline grey darken-1 proxima_nova-font">
          Log in
        </v-card-title>

        <v-card-actions class="proxima_nova-font">
          <v-card-text>
            <v-form>
              <v-text-field
                v-model="username"
                label="Username"
                color="red"
                required
              ></v-text-field>
              <v-text-field
                v-model="password"
                type="password"
                label="Password"
                color="red"
                required
              ></v-text-field>
              <!-- <v-checkbox
            v-model="checkbox"
            :error-messages="checkboxErrors"
            label="Do you agree?"
            required
            @change="$v.checkbox.$touch()"
            @blur="$v.checkbox.$touch()"
          ></v-checkbox> -->
            </v-form>
            <p class="city">{{ messege }}</p>
            <v-btn color="red" class="mr-4" @click="login">
              Log in
            </v-btn>
          </v-card-text>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
  <div v-else>
    <v-container>
      <v-row class="action">
        <v-col>
          <v-img
            :src="require('../assets/waiter.png')"
            class="my-3"
            contain
            height="900"
            v-if="isWaiter"
          />
          <v-img
            :src="require('../assets/chef.png')"
            class="my-3"
            contain
            height="900"
            v-if="isChef"
          />
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data: () => ({
    dialog: true,
    username: "",
    password: ""
    // ecosystem: [
    //   {
    //     text: "vuetify-loader",
    //     href: "https://github.com/vuetifyjs/vuetify-loader"
    //   },
    //   {
    //     text: "github",
    //     href: "https://github.com/vuetifyjs/vuetify"
    //   },
    //   {
    //     text: "awesome-vuetify",
    //     href: "https://github.com/vuetifyjs/awesome-vuetify"
    //   }
    // ],
    // importantLinks: [
    //   {
    //     text: "Documentation",
    //     href: "https://vuetifyjs.com"
    //   },
    //   {
    //     text: "Chat",
    //     href: "https://community.vuetifyjs.com"
    //   },
    //   {
    //     text: "Made with Vuetify",
    //     href: "https://madewithvuejs.com/vuetify"
    //   },
    //   {
    //     text: "Twitter",
    //     href: "https://twitter.com/vuetifyjs"
    //   },
    //   {
    //     text: "Articles",
    //     href: "https://medium.com/vuetify"
    //   }
    // ],
    // whatsNext: [
    //   {
    //     text: "Explore components",
    //     href: "https://vuetifyjs.com/components/api-explorer"
    //   },
    //   {
    //     text: "Select a layout",
    //     href: "https://vuetifyjs.com/layout/pre-defined"
    //   },
    //   {
    //     text: "Frequently Asked Questions",
    //     href: "https://vuetifyjs.com/getting-started/frequently-asked-questions"
    //   }
    // ]
  }),
  computed: {
    value() {
      return !this.$store.getters.getIsLogin;
    },
    messege() {
      return this.$store.getters.loginMessage;
    },
    isWaiter() {
      return this.$store.getters.isWaiter;
    },
    isChef() {
      return this.$store.getters.isCooker;
    }
  },
  methods: {
    login() {
      const latest = {
        username: this.username,
        password: this.password
      };
      this.$store.dispatch("checkLogin", latest);
    }
  }
};
</script>
<style>
.city {
  color: #f44336;
  font-weight: 600;
}
.action {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 90vh;
}
</style>
