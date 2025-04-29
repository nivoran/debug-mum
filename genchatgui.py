import tkinter as tk
from tkinter import scrolledtext
from tkinter import simpledialog, messagebox
from google import genai # Assurez-vous d'avoir installé cette librairie

client = genai.Client(api_key="AIzaSyD9bPq1-Pi6vXaWJXE9Cz_aKR7XZfh7KKA")
chat = client.chats.create(model="gemini-2.0-flash")
#chat = model.start_chat()

class ChatbotGUI:
    def __init__(self, master):
        self.master = master
        master.title("Chatbot ProSpeak by LABIRINT")
        self.username = None  # Variable pour stocker le pseudo

         # Zone de texte pour les messages de l'utilisateur
        self.user_chat_area = scrolledtext.ScrolledText(master, width=60, height=10)
        self.user_chat_area.grid(row=0, column=0, padx=10, pady=5, sticky="nsew")
        self.user_chat_area.config(state=tk.DISABLED)

        # Zone de texte pour les messages de Gemini
        self.gemini_chat_area = scrolledtext.ScrolledText(master, width=60, height=10)
        self.gemini_chat_area.grid(row=1, column=0, padx=10, pady=5, sticky="nsew")
        self.gemini_chat_area.config(state=tk.DISABLED)

        self.input_label = tk.Label(master, text="Votre message:")
        self.input_label.grid(row=2, column=0, padx=10, pady=5, sticky="w")

        self.input_entry = tk.Entry(master, width=50)
        self.input_entry.grid(row=2, column=0, padx=10, pady=5)
        self.input_entry.config(state=tk.DISABLED)
        self.input_entry.bind("<Return>", self.send_message) # Envoyer avec la touche Entrée

        self.send_button = tk.Button(master, text="Envoyer", command=self.send_message)
        self.send_button.grid(row=2, column=1, padx=5, pady=5)
        
        # Configuration des poids des lignes et colonnes pour le redimensionnement
        master.grid_rowconfigure(0, weight=1)
        master.grid_rowconfigure(1, weight=1)
        master.grid_rowconfigure(3, weight=0)
        master.grid_columnconfigure(0, weight=1)
        master.grid_columnconfigure(1, weight=0)

        self.ask_username() # Appeler la fonction pour demander le pseudo au démarrage

    def ask_username(self):
        username_dialog = tk.Toplevel(self.master)
        username_dialog.title("Entrez votre pseudo")
        username_dialog.resizable(False, False) # Empêcher le redimensionnement

        username_label = tk.Label(username_dialog, text="Pseudo:")
        username_label.grid(row=0, column=0, padx=10, pady=10)

        username_entry = tk.Entry(username_dialog, width=30)
        username_entry.grid(row=0, column=1, padx=10, pady=10)
        username_entry.focus_set() # Mettre le focus sur le champ de saisie

        def set_username():
            self.username = username_entry.get()
            self.input_entry.config(state=tk.NORMAL)
            if not self.username:
                messagebox.showerror("Erreur", "Le pseudo ne peut pas être vide.")
                username_entry.focus_set()
                return
            self.display_user_message("ProSpeak:", f"Bienvenue, {self.username}!")
            username_dialog.destroy()

        submit_button = tk.Button(username_dialog, text="Valider", command=set_username)
        submit_button.grid(row=1, column=0, columnspan=2, padx=10, pady=10)

        # Empêcher l'interaction avec la fenêtre principale tant que la fenêtre de pseudo est ouverte
        self.master.wait_window(username_dialog)

    def send_message(self, event=None):
        user_input = self.input_entry.get()
        self.input_entry.delete(0, tk.END)

        if user_input:
            self.display_gemini_message(self.username+":", user_input)
            self.get_gemini_response(user_input)

    def display_user_message(self, sender, message):
        self.user_chat_area.config(state=tk.NORMAL)
        self.user_chat_area.insert(tk.END, f"{sender} {message}\n\n")
        self.user_chat_area.config(state=tk.DISABLED)
        self.user_chat_area.yview(tk.END)

    def display_gemini_message(self, sender, message):
        self.gemini_chat_area.config(state=tk.NORMAL)
        self.gemini_chat_area.insert(tk.END, f"{sender} {message}\n\n")
        self.gemini_chat_area.config(state=tk.DISABLED)
        self.gemini_chat_area.yview(tk.END)


    def get_gemini_response(self, user_message):
        try:
            prompt = f"""Tu es un professeur d'anglais conversationnel. Notre interaction doit se dérouler sous forme de conversation naturelle. Pose-moi des questions sur des sujets du quotidien en anglais pour pratiquer ma compréhension et mon expression orale. Adapte la difficulté de tes questions à mon niveau (que tu peux évaluer au fur et à mesure de nos échanges). Ne donne pas de longues explications grammaticales à moins que je ne le demande explicitement. Tes réponses doivent être concises et engageantes pour maintenir une conversation fluide.

        Ma dernière question/affirmation : {user_message}

        Ta prochaine réponse/question :"""
            response = chat.send_message(user_message)
            gemini_response = response.text
            self.display_user_message("ProSpeak:", gemini_response)
        except Exception as e:
            self.display_gemini_message("Erreur:", f"Une erreur s'est produite : {e}")

if __name__ == "__main__":
    root = tk.Tk()
    gui = ChatbotGUI(root)
    root.mainloop()