package com.sist.web;

import com.sist.dao.FundingGoodsDAO;
import com.sist.dao.StoreDAO;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.StoreVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("register/*")
public class FundingRegisterController {

    private final FundingGoodsDAO fundingFoodsDao;
    private final StoreDAO StoreDao;

    @GetMapping("register.do")
    public String register() {
        return "register/register_funding";
    }

    @PostMapping("register.do")
    public String registerPost(FundingForm form, HttpSession session) throws ParseException {
        int user_no = (int) session.getAttribute("user_no");
        fundingFoodsDao.insertFunding(new FundingGoodsVO(form, user_no));
        return "redirect:/register/main.do";
    }

    @GetMapping("main.do")
    public String main() {

        return "register/register_main";
    }

    @GetMapping("list.do")
    public String registerList(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session) {
        int user_no = (int) session.getAttribute("user_no");
        Map map = new HashMap();
        int size = 3;
        int start = (size * page) - (size - 1);
        int end = size * page;

        map.put("start", start);
        map.put("end", end);
        map.put("user_no", user_no);
        List<FundingGoodsVO> list = fundingFoodsDao.fundingMyListData(map);
        list.forEach(FundingGoodsVO::setCategory);
        int totalpage = fundingFoodsDao.fundingToMyTalPage(user_no);
        System.out.println("totalpage = " + totalpage);
        model.addAttribute("next", totalpage > page);
        model.addAttribute("prev", page > 1);
        model.addAttribute("list", list);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("prevPage", page - 1);
        return "register/register_fundinglist";
    }

    @GetMapping("storeReg.do")
    public String registerStore(int fundingId, Model model) {
        FundingGoodsVO fundingInfo = fundingFoodsDao.findById(fundingId);
        model.addAttribute("fundingInfo", fundingInfo);
        return "register/register_store";
    }


    @PostMapping("storeReg.do")
    public String registerStorePost(StoreForm form, HttpSession session) throws ParseException {
        int user_no = (int) session.getAttribute("user_no");
        StoreDao.insertStore(new StoreVO(form, user_no), form.fg_no);
        return "redirect:/register/main.do";
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FundingForm {
        private String title;
        private String img;
        private int price;
        private int goal_amount;
        private String open_date;
        private String close_date;
        private String content;
        private String sub_img;
        int fc_no;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StoreForm {
        private int fg_no;
        private String title;
        private String img;
        private String price;
        private int goal_amount;
        private int stock;
        private String open_date;
        private String content;
        private String sub_img;
        int fc_no;
    }

}
