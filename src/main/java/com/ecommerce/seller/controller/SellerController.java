package com.ecommerce.seller.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.ecommerce.seller.service.SellerService;

@RestController
@RequestMapping("/api/v1/sellers")
public class SellerController {

    private final SellerService service;

    public SellerController(SellerService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<String> getSeller() {
        return ResponseEntity.ok("Seller Service is running!");
    }
}
