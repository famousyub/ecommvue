<template>
    <div>
      <TopHeaderAuth />
      <b-container class="mt-5">

        

        <section class="container py-20">
	<div class="grid grid-cols-1 md:grid-cols-2 bg-primary rounded-xl shadow-3xl overflow-hidden">
		<div class="flex flex-col items-center justify-between gap-8 p-5 md:p-10 lg:p-14">
			<div>
        <b-row align-h="center">
          <b-col cols="7">
            <b-card style="color: #001e5f">
              <h4 class="font-weight-bold">Créer un compte</h4>
              <b-form @submit.stop.prevent="createAccount" class="mt-4">
                <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-first-name"
                      label="Prénom"
                      label-for="input-first-name"
                    >
                    <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-circle-user"></i></label>
                      <b-form-input
                        v-model="firstName"
                        ref="firstNameField"
                        id="input-first-name"
                        type="text"
                        class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                        :state="firstNameValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="firstName"
                        :state="firstNameValidation"
                      >
                      Votre prénom peut comporter 15 caractères.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                  <b-col>
                    <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-circle-user"></i></label>
                    <b-form-group
                      id="input-group-last-name"
                      label="Nom"
                      label-for="input-last-name"
                    >
                      <b-form-input
                        v-model="lastName"
                        id="input-last-name"
                        type="text"
                        class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                        :state="lastNameValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="lastName"
                        :state="lastNameValidation"
                      >
                      Votre nom de famille peut comporter 15 caractères.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                </b-row>
                <b-row>
                
                  <b-col>
                    <b-form-group
                      id="input-group-phone-number"
                      label="Numéro de téléphone"
                      label-for="input-phone-number"
                    >
                    <span>
                    <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-phone"></i></label> 
                     <b-form-input
                        v-model="phoneNumber"
                        id="input-phone-number"
                        type="text"
                        class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                        :state="phoneNumberValidation"
                        required
                      />
                    </span>
                      <b-form-invalid-feedback
                        v-if="phoneNumber"
                        :state="phoneNumberValidation"
                      >
                        

                      Votre numéro de téléphone doit comporter au moins 8 chiffres.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                </b-row>
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
                    class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                    @keyup="validEmail = true"
                    :state="validEmail && emailValidation"
                    required
                  />
                  <b-form-invalid-feedback
                    v-if="email"
                    :state="validEmail && emailValidation"
                  >
                    {{ emailMessage }}
                  </b-form-invalid-feedback>
                </b-form-group>
  
                <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-password"
                      label="mot de passe"
                      label-for="input-password"
                    >
                    <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-lock"></i></label>
                      <b-form-input
                        v-model="password"
                        id="input-password"
                        type="password"
                        class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                        :state="newPasswordValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="password"
                        :state="newPasswordValidation"
                      >

                      Votre mot de passe peut comporter entre 8 et 32 caractères, contenir
                        lettres, chiffres et ne doit pas contenir d'espace.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                  <b-col>
                    <b-form-group
                      id="input-group-confirm-password"
                      label="Confirmez le mot de passe"
                      label-for="input-confirm-password"
                    >
                    <label class="px-3 py-1 text-lg join-item text-pastelBlue border-r border-r-slate-400"><i class="fa-solid fa-lock"></i></label>
                      <b-form-input
                        v-model="confirmPassword"
                        id="input-confirm-password"
                        type="password"
                        class="px-3 py-2 w-full text-sm join-item outline-none bg-transparent"
                        :state="confirmPasswordValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="confirmPassword"
                        :state="confirmPasswordValidation"
                      >
                        
                      Le mot de passe ne correspond pas
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                </b-row>
  
                <b-row class="mt-3">
                  <b-col cols="3" />
                  <b-col cols="6">
                    <b-button block type="submit" class="p-2" variant="warning">
                      Créer un compte
                    </b-button>
                  </b-col>
                  <b-col cols="3" />
                </b-row>
              </b-form>
              <hr />
              <b-row>
                <b-col class="text-center">
                  <a>
                    Vous avez déjà un compte?</a><a href="/login">&nbsp;Connexion</a>
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
  import MyFooter from "@/components/Common/MyFooter.vue";
  import 'tailwindcss/tailwind.css';
  
  import './Register.css';
  export default {
    name: "Register",
    components: {
      TopHeaderAuth,
      MyFooter,
    },
    data() {
      return {
        firstName: null,
        lastName: null,
        email: null,
        formatName: /^.{1,15}$/,
        formatEmail: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
        formatPassword: /^[a-zA-z0-9]{8,32}$/,
        password: null,
        validEmail: true,
        confirmPassword: null,
        emailMessage: null,
        phoneNumber: null,
        formatPhoneNumber: /^[0-9]{8,32}$/,
      
      };
    },
    mounted() {
      this.$refs.firstNameField.focus();
    },
    computed: {
      tokenAlert() {
        if (this.message == null) return null;
        else if (this.message.length == 0) return false;
        else return true;
      },
      firstNameValidation() {
        if (this.firstName == null) return null;
        else if (!this.formatName.test(this.firstName)) return false;
        else return true;
      },
      lastNameValidation() {
        if (this.lastName == null) return null;
        else if (!this.formatName.test(this.lastName)) return false;
        else return true;
      },
      emailValidation() {
        if (this.email == null) return null;
        else if (!this.formatEmail.test(this.email)) return false;
        else return true;
      },
      newPasswordValidation() {
        if (this.password == null) return null;
        else if (!this.formatPassword.test(this.password)) return false;
        else return true;
      },
      confirmPasswordValidation() {
        if (this.confirmPassword == null) return null;
        else if (
          this.confirmPassword != this.password ||
          !this.formatPassword.test(this.confirmPassword)
        )
          return false;
        else return true;
      }, 
      phoneNumberValidation() {
        if (this.phoneNumber == null) return null;
        else if (
          !this.formatPhoneNumber.test(this.phoneNumber)
        )
          return false;
        else return true;
      },
    },
    methods: {
      async createAccount() {
        if (
          !this.firstNameValidation ||
          !this.lastNameValidation ||
          !this.emailValidation ||
          !this.newPasswordValidation ||
          !this.confirmPasswordValidation ||
          !this.phoneNumberValidation
        )
          return;
        try {
          const user = await AuthenticationService.register({
            firstName: this.firstName,
            lastName: this.lastName,
            email: this.email,
            password: this.password,
            phoneNo:this.phoneNumber,
            
            
          });
          this.$store.dispatch("CurrentUser/setNewUserId", user.data.id);
          this.$store.dispatch("CurrentUser/setNewUserEmail", this.email);
          console.log("here");
          this.$router.push({ path: "/user-verify" });
        } catch (error) {
          this.validEmail = false;
          this.emailMessage = error.response.data.error;
        }
      },
    },
  };
  </script>
  
  <style scoped lang="scss"></style>
  