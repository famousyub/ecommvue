<template>
    <div>
      <ATopHeader />
      <b-container class="mt-5">
        <b-row align-h="center">
          <b-col cols="7">
            <b-card style="color: #001e5f">
              <h4 class="font-weight-bold">Créer un compte fournisseur</h4>
              <b-form @submit.stop.prevent="createAccount" class="mt-4">
                <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-first-name"
                      label="Prénom "
                      label-for="input-first-name"
                    >
                      <b-form-input
                        v-model="firstName"
                        ref="firstNameField"
                        id="input-first-name"
                        type="text"
                        :state="firstNameValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="firstName"
                        :state="firstNameValidation"
                      >
                        Your first name could be 15 character long.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                  <b-col>
                    <b-form-group
                      id="input-group-last-name"
                      label="Nom"
                      label-for="input-last-name"
                    >
                      <b-form-input
                        v-model="lastName"
                        id="input-last-name"
                        type="text"
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
                <b-col>
                    <b-form-group
                      id="input-group-phone-number"
                      label="Numéro de téléphone"
                      label-for="input-phone-number"
                    >
                      <b-form-input
                        v-model="phoneNumber"
                        id="input-phone-number"
                        type="text"
                        :state="phoneNumberValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="phoneNumber"
                        :state="phoneNumberValidation"
                      >
                        Votre numéro de téléphone doit comporter au moins 8 chiffres.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                <b-form-group
                  id="input-group-email"
                  label="Email"
                  label-for="input-email"
                >
                  <b-form-input
                    v-model="email"
                    id="input-email"
                    type="email"
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
                      label="Mot de passe"
                      label-for="input-password"
                    >
                      <b-form-input
                        v-model="password"
                        id="input-password"
                        type="password"
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
                      <b-form-input
                        v-model="confirmPassword"
                        id="input-confirm-password"
                        type="password"
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
                <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-company-name"
                      label="Nom de l'entreprise"
                      label-for="input-company-name"
                    >
                      <b-form-input
                        v-model="companyName"
                        ref="companyNameField"
                        id="input-company-name"
                        type="text"
                        :state="CompanyNameValidation"
                       required
                      />
                      <b-form-invalid-feedback
                        v-if="companyName"
                        :state="CompanyNameValidation"
                      >
                         Le nom de votre entreprise peut comporter 15 caractères.
                      </b-form-invalid-feedback>
                    
                    </b-form-group>
                  </b-col>
                </b-row>
                <b-row class="mt-3">
                  <b-col cols="3" />
                  <b-col cols="6">
                    <b-button @click="addedSupplier()" block type="submit"  class="p-2" variant="warning">
                       Créer un compte
                    </b-button>
                  </b-col>
                  <b-col cols="3" />
                </b-row>
              </b-form>
              <hr />
              
            </b-card>
          </b-col>
        </b-row>
      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import AuthenticationService from "@/services/AuthenticationService.js";
 
  import ATopHeader from "@/components/Admins/ATopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  export default {
    name: "AddSupplier",
    components: {
      ATopHeader,
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
        priority:2,
        companyName:null,
        phoneNumber: null,
        formatPhoneNumber: /^[0-9]{8,32}$/,
        formatCompanyName: /^[a-zA-Z]{1,15}$/,
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
      CompanyNameValidation() {
        if (this.companyName == null) return null;
        else if (
          !this.formatCompanyName.test(this.companyName)
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
          
          !this.CompanyNameValidation ||
          !this.phoneNumberValidation
           
        )
          return;
          
        try {
          
          const user = await AuthenticationService.registerSupplier({
            firstName: this.firstName,
            lastName: this.lastName,
            email: this.email,
            password: this.password,        
            phoneNo:this.phoneNumber
  
          });
          console.log(user.data)
         
          this.$store.dispatch("CurrentUser/setNewUserId", user.data.id);
          this.$store.dispatch("CurrentUser/setNewUserEmail", this.email);
       
         
          this.$router.push({ path: "/admin/users" });
        } catch (error) {
          this.validEmail = false;
          this.emailMessage = error.response.data.error;
        }
      },
      async addedSupplier(){ 
      this.$bvToast.toast("Fournisseur a été ajouté avec succès ", {
            title: "Ajouter Fournisseur",
            variant: "success",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        },
    },
  };
  </script>
  
  <style scoped lang="scss"></style>
  