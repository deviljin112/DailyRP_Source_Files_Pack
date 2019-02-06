const Dashcam = new Vue({
    el: "#Dashcam_Body",

    data: {
        showDash: false,

        gameTime: 0,
        clockTime: {},
        unitNumber: 0,
        unitName: "",
        unitSpeed: 0,
        unitSpeedType: "MPH",

        dashMessageOne: "Ten pojazd jest zarejestrowany do",
        dashLabel: "State of San Andreas",
        dashMessageTwo: "Nie autoryzowane uzycie nagrania jest karane pod prawem, 13 S.A. Pen. Code 502(a)."
    },

    methods: {

        EnableDashcam() {
            this.showDash = true;
        },

        DisableDashcam() {
            this.showDash = false;
        },

        UpdateDashcam(data) {
            this.gameTime = data.gameTime;
            this.clockTime = data.clockTime;
            this.unitNumber = data.unitNumber;
            this.unitName = data.unitName;
            this.unitSpeed = Math.round(data.unitSpeed);

            if (data.useMPH) {
                this.unitSpeedType = "MPH";
            } else {
                this.unitSpeedType = "KMH";
            };
        },

    }
});

document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {
            if (event.data.type == "enabledash") {
                
                Dashcam.EnableDashcam();

            } else if (event.data.type == "disabledash") {

                Dashcam.DisableDashcam();

            } else if (event.data.type == "updatedash") {

                Dashcam.UpdateDashcam(event.data.info);

            }

        });
    };
};