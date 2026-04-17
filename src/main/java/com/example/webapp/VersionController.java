package com.example.cicddemo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class VersionController {

    @GetMapping("/")
    public String getDashboard(Model model) {
        // CI/CD 테스트 시 아래 두 변수의 값을 변경하며 테스트합니다.
        String version = "v1.0.0";
        String bgColor = "#0000ff"; // 초기 색상: 파란색

        // 캐시가 아닌 새로 배포된 서버임을 확인하기 위한 서버 시간
        String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        model.addAttribute("version", version);
        model.addAttribute("bgColor", bgColor);
        model.addAttribute("serverTime", serverTime);

        return "index";
    }
}
