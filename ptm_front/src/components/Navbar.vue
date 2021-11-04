<template>
    <nav>
        <v-toolbar flat app>
            <v-toolbar-title class="text-uppercase grey--text">
                <v-btn class="font-weight-bold" to="/">Time Manager</v-btn>
            </v-toolbar-title>
            
            <div>
                <v-btn depressed class="font-weight-light" to="/about">Help</v-btn>
            </div>
            
            <v-spacer></v-spacer>
            
            <v-btn flat color="grey" to="/account">
                <span>Manage Account</span>
                <v-icon right>person</v-icon>
            </v-btn>
        </v-toolbar>
    </nav>
</template>

<script>
export default {
  data() {
    return {
      drawer: false
    }
  }
}
</script>