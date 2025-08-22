package com.example.chat_room.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.example.chat_room.dto.ChatMessage;

@Controller
public class ChatController {

    @MessageMapping("/chat")             // Maps to /app/chat
    @SendTo("/topic/messages")           // Sends to /topic/messages
    public ChatMessage handleMessage(ChatMessage message) {
        System.out.println("Received message: " + message.getContent());
        return new ChatMessage(message.getSender(), message.getContent());
    }
}
