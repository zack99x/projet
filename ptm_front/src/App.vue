<template>
    <v-app class="grey lighten-4">
        <Navbar/>
        <v-main>
            <router-view/>
        </v-main>
    </v-app>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
export default {
    name: 'App',
    components: {
        Navbar,
    },
    data() {
        return {

        }
    },
};
</script>
