package com.siddique.e_comerse_web.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.siddique.e_comerse_web.entity.OrderEntity;
import com.siddique.e_comerse_web.entity.product;
import com.siddique.e_comerse_web.service.OrderService;
import com.siddique.e_comerse_web.service.ProductService;

@Controller
public class EccomerseWebController {
	@Autowired
	ProductService productservice;
	@Autowired
	OrderService orderservice;
	@GetMapping("/")
	public String Homepage(Model model) {
		List<product> list= productservice.getallproducts();
		model.addAttribute("productlist", list);
		return "index.jsp";
	}
	
	@GetMapping("/LoginPage")
	public String LoginPage() {
		return "login.jsp";
	}
	
	@PostMapping("/Login")
	public String Login(String username, String password) {
	String page="";
	if(username.equals("siddique")&& password.equals("siddique@5/7"))
		page="AdminPanel.jsp";
	else
		page="LoginFailed.jsp";
	
	return page;
}
	@GetMapping("/Newproduct")
	public String Newproduct(){
		return"Newproduct.html"; 
	}
	@PostMapping("/saveproduct")
	public String saveproduct(@ModelAttribute product pro,
	                          @RequestPart("imageFile") MultipartFile file) throws IOException {

	    if (!file.isEmpty()) {
	        String uploadDir = "E:/proct-images";
	        String fileName = file.getOriginalFilename();
	        Path filePath = Paths.get(uploadDir, fileName);
	        Files.write(filePath, file.getBytes());
	        pro.setImage_src("/product-images/" + fileName); 
	    }

	    productservice.addproduct(pro);
	    return "Newproductadded.jsp";
	}

	@GetMapping("/Editproduct")
	public String Editproduct(Model model) {
		List<product> list= productservice.getallproducts();
		model.addAttribute("productlist", list);
		return "Editproduct.jsp";
	}
	@GetMapping("/shop")
	public String shop(Model model) {
		List<product> list= productservice.getallproducts();
		model.addAttribute("products", list);
		return "shop.jsp";
	}
	@GetMapping("/editProductForm")
	public String editProductForm(int id,Model model) {
		product pro= productservice.getbyId(id);
		model.addAttribute("product", pro);
		return "UpdateProduct.jsp";
	}
	
	@PostMapping("/updateProduct")
	public String updateProduct(product pro){

	    productservice.addproduct(pro);
	    return "Newproductadded.jsp";
		
	}
	@GetMapping("/deleteProduct")
	public String deleteProduct( int id) {
	    productservice.delete(id);
	    return "redirect:/Editproduct";
	}
	@GetMapping("/checkout")
    public String checkout( int id, Model model) {
        product pro = productservice.getbyId(id);
        model.addAttribute("product", pro);
        return "orderPage.jsp";
    }
	@PostMapping("/placeOrder")
	public String placeOrder(OrderEntity order, Model model) {
	    orderservice.saveOrder(order);
	    model.addAttribute("order", order); 
	    return "OrderSuccess.jsp";
	}
	
	@GetMapping("/viewOrders")
	public String viewOrders(Model model) {
	    List<OrderEntity> orders = orderservice.getAllOrders();
	    model.addAttribute("orders", orders);
	    return "viewOrders.jsp";
	}
}
	
