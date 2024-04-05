<template>
    <div>
      <TopHeaderAuth />
      <b-container class="mt-5">




        

        <section class="container py-20">
	<div class="grid grid-cols-1 md:grid-cols-2 bg-primary rounded-xl shadow-3xl overflow-hidden">
		<div class="flex flex-col items-center justify-between gap-8 p-5 md:p-10 lg:p-14">
			<div>




        <b-row align-h="center">
          <b-col cols="10" md="7" lg="5">
            <b-card style="color: #001e5f">
              <h4 class="font-weight-bold">Connexion</h4>
              <b-form @submit.stop.prevent="login" class="mt-4">
                <b-form-group
                  id="input-group-email"
                  label="Email"
                  label-for="input-email"
                 
                >
                <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-envelope"></i></label>
                  <b-form-input
                    v-model="email"
                    id="input-email"
                    type="email"
                    ref="emailField"
                    class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                    :state="emailValidation"
                    required
                  />
                  <b-form-invalid-feedback :state="emailValidation">
                    {{ invalidEmailMessage }}
                  </b-form-invalid-feedback>
                </b-form-group>
  
                <b-form-group
                  id="input-group-password"
                  label="Mot de passe"
                  label-for="input-password"
                >
                <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-lock"></i></label>
                  <b-form-input
                    v-model="password"
                    id="input-password"
                    class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                    type="password"
                    required
                  />
                </b-form-group>
                <b-alert
                  variant="primary"
                  class="my-2 p-1 pl-2"
                  :show="loginAlert"
                >
                  {{ loginMessage }}
                </b-alert>
                <b-row>
                  <b-col cols="3" />
                  <b-col cols="6">
                    <b-button
                      block
                      class="p-2 mt-2"
                      type="submit"
                      variant="warning"
                    >
                      Connexion
                    </b-button>
                  </b-col>
                  <b-col cols="3" />
                </b-row>
              </b-form>
              <b-row class="mt-2">
                <b-col class="text-center">
                  <small>
                    <b-link v-b-toggle.request-password-token>
                      Mot de passe oublié?
                    </b-link>
                  </small>
                </b-col>
              </b-row>
              <b-collapse id="request-password-token">
                <ReqPassToken />
              </b-collapse>
              <hr />
              <b-row>
                <b-col class="text-center">
                  Nouveau client?&nbsp;
                  <b-link to="/register">Créez votre compte</b-link>
                </b-col>
              </b-row>
            </b-card>
          </b-col>
        </b-row>





      </div>
      </div>

  </div>
        </section>

      




      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import AuthenticationService from "@/services/AuthenticationService.js";
  import TopHeaderAuth from "@/components/Common/TopHeaderAuth.vue";
  import ReqPassToken from "@/components/User/ReqPassToken.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import './Login.css';
  export default {
    name: "Login",
    components: {
      TopHeaderAuth,
      ReqPassToken,
      MyFooter,
    },
    data() {
      return {
        email: null,
        password: null,
        emailValidation: null,
        invalidEmailMessage: "",
        loginMessage: null,
        loginAlert: false,
      };
    },
    mounted() {
      this.$refs.emailField.focus();
    },
    methods: {
      async login() {
        var user 
        try {
          
          user = ( await AuthenticationService.checkRegsToken({
              email: this.email,
            })
          ).data;
          
        } catch (error) {
        
          console.log(user)
          console.log(error);
          this.emailValidation = false;
          this.invalidEmailMessage = "User not found.";
          return;
        }
        if (!user.verificationStatus) {
          this.$store.dispatch("CurrentUser/setNewUserId", user.id);
          this.$store.dispatch("CurrentUser/setNewUserEmail", this.email);
          this.$router.push({ path: "/user-verify" });
          return;
        }
  
        try {
          const response = (
            await AuthenticationService.login({
              email: this.email,
              password: this.password,
            })
          ).data;
          this.$store.dispatch("CurrentUser/setToken", response.token);
          this.$store.dispatch("CurrentUser/setUser", response.user);
          this.$store.dispatch("Wishlist/setWishlist");
          this.$router.push({ path: "/" });
        } catch (error) {
          this.loginAlert = true;
          this.loginMessage = error.response.data.error;
        }
      },
    },
  };
  </script>
  
  <style scoped lang="scss"></style>
  