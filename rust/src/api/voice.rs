#[flutter_rust_bridge::frb(opaque)]
pub struct VoiceConnectionManager {
    relay_connection: libconfa::VoiceRelayConnection,
    current_voice_connection: Option<libconfa::VoiceConnection>,
}

impl VoiceConnectionManager {
    // #[flutter_rust_bridge::frb(async)]
    pub async fn new(relay_address: String) -> Self {
        let relay_connection = libconfa::VoiceRelayConnection::connect(relay_address)
            .await
            .unwrap();
        VoiceConnectionManager {
            relay_connection: relay_connection,
            current_voice_connection: None,
        }
    }

    pub async fn voice_join(&mut self, server_id: String, channel_id: String, user_id: String) {
        self.current_voice_connection = Some(
            self.relay_connection
                .join(server_id, channel_id, user_id)
                .await
                .unwrap(),
        );
    }

    pub async fn voice_leave(&mut self) {
        self.current_voice_connection = None;
    }

    // #[flutter_rust_bridge::frb(sync)]
    // pub fn start(&self) -> String {
    //     "Daemon started".to_string()
    // }

    // #[flutter_rust_bridge::frb(sync)]
    // pub fn stop(&self) -> String {
    //     "Daemon stopped".to_string()
    // }
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
