package com.error404.pumpkinplace;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.persistence.ShowBoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class ShowBoardDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(ShowBoardDaoTest.class);

	@Autowired
	private ShowBoardDao showboardDao;

	@Test
	public void doTest() throws InterruptedException, ParseException {
//		 insertBulkData();
		 insertTest();
//		 testSelectAll();  
//		 testSelectBySbNo();
//		 testUpdate();
//		 testDelete();
//		 testTotalCount();
//		 testSearch();
	}

	private void insertBulkData() throws InterruptedException {
		for (int i = 1; i <= 1; i++) {
			ShowBoard showBoard = new ShowBoard(0, "황총민", "밴드 컴백공연", "우리가 돌아왔다", "서울", 0, "02-234-4732", "서울시 강남구 00클럽",
					new Date(), "c://image", "c://video", new Date(), new Date());
			showboardDao.insert(showBoard);
			Thread.sleep(100);
		}
	}

	private void insertTest() throws ParseException {
//		ShowBoard showBoard1 = new ShowBoard(6, "황총민", "밴드 리턴", "우리가 돌아왔다", "서울", 0, "02-234-4732", "서울시 강남구 00클럽", new Date(), "c://image", "c://video", new Date(), new Date());
		ShowBoard showBoard2 = new ShowBoard(1, "Hanwha", "Lifeplus 벚꽃피크닉 페스티벌 2018", "라인업 이적, 아이콘, 정준일, 소유, 정기고, 곽진언, 민서, 박재정 드레스코드: 핑크 티켓 이벤트기간: 2018.03.14.~04.02 까지 핑크,블라썸 스테이지티켓 응모가능 벚꽃이 흩날리는 봄날 올해로 3번째 열리는 Lifeplus 벚꽃피크닉 페스티벌! 설레는 봄날에 어울리는 뮤지션들의 블라썸 콘서트와 송은이&김숙과 함께 썸타는 이야기와 달달한 음악을 즐길 수 있는 블라썸토크! 그리고 청년작가들의 작품들로 가득한 블라썸마켓과 봄날의 입맛을 돋워주는 푸드트럭까지~ 낮에는 벚꽃이, 밤에는 불꽃이! 화려한 블라썸쇼와 함께 봄날의 설렘을 만끽하세요! 공연티켓은 Lifeplus 홈페이지에서 14일부터 4월2일까지 프로모션 참여를 통해 받을수 있으며 티켓구매도 가능합니다", "서울", 55000, "02-1234-5678", "63빌딩 야외주차장 및 한강공원", new Date(), "", "gfAWUMln0Xg", new Date(), new Date());
		ShowBoard showBoard3 = new ShowBoard(2, "힙합", "힙합 플레이야 페스티벌 2018", "국내 최고의 힙합뮤직페스티벌, 단독 공연에 버금갈 정도로 퀄리티있는 힙합플레이야 페스티벌로 힙합계에서 대표적인 뮤지션들을 총 집합시킨 힙뮤페는 블라인드 티켓 2분만에 매진될 정도로 흥행을 일으키고 있습니다! 탄탄한 라인업으로 팬들의 마음을 흔들어 놓고있는 힙뮤페! 힙합계의 거장 다이나믹듀오부터 넉살, 기리보이, 해쉬스완, 올티 등 인기 있는 힙합 뮤지션들이 대거 출연하는 힙합 씬을 대표하는 페스티벌입니다.", "서울", 88000, "02-1234-5678", "난지한강공원", new Date(), "", "M8FEhYURR3E", new Date(), new Date());
		ShowBoard showBoard4 = new ShowBoard(3, "청춘", "청춘 페스티벌 2018", "<청춘페스티벌: 아무나대잔치-그냥 아무나 되자> 이번 청춘 페스티벌 슬로건은 그냥 아무 ‘나’ 되자!입니다. 무언가 해내야 할것같고, 무언가 되어야 한다는 부담감을 갖고있는 모든 청춘들에게 그냥 아무 ‘나’ 되자 라는 이번 말이 청춘들 마음에 확 와닿네요, 올해로 벌써 10년째를 맞이한 청춘페스티벌은 이번에도 핫한 라인업으로 강연과 음악들로 청춘들의 기대를 듬뿍 받고있습니다!", "서울", 50000, "02-1234-5678", "난지한강공원", new Date(), "", "1aSyeOChVx4", new Date(), new Date());
		ShowBoard showBoard5 = new ShowBoard(4, "뷰티풀", "뷰티풀 민트 라이프 2018", "봄의 정점에서 만나는 우리들의 아름다운 주말, 아홉 번째 뷰티풀 민트 라이프 반복되는 일상 속에서 예상치 못하게 찾아온 작은 기쁨처럼, 크고 화려하지는 않지만 오랫동안 마음 속 깊이 기억될 우리 모두의 ‘아름답고(뷰티풀), 청량하며(민트), 일상적인(라이프)’ 주말 아홉 번째 뷰민라를 맞이하는 솔직한 가장 큰 바람은 ‘보다 큰 감동을 위한 연출이 더해진 공연, 문화체육센터를 중심으로 한 참여형 프로그램과 이벤트, 뷰민라에서만 만날 수 있는 현장 데커레이션과 아트워크’ 등 준비한 것들을 선보인다고 합니다!", "서울", 77000, "02-1234-5678", "올림픽공원", new Date(), "", "92UGXuVptQg", new Date(), new Date());
		ShowBoard showBoard6 = new ShowBoard(5, "그린", "그린플러그드 서울 2018", "환경 캠페인 뮤직페스티벌 <그린플러그드 서울> 이번에 9회를 맞이하는 그린플러그드 서울은 ‘더나은 내일을 위한 착한 생각과 작은 실천’을 모토로 시작된 페스티벌입니다. 환경 캠페인 뮤직페스티벌인 만큼 환경을 위한 노력으로 관객 모두가 주변 쓰레기를 정리하는 클리닝 타임부터 다양한 프로젝트와 다양한 활동을 매년 해 나가고 있습니다. 다채로운 장르의 인기 있는 뮤지션들이 풍성하게 균형을 이룬 라인업으로, 페스티벌의 흥행을 떠나 음악팬들과 신인 뮤지션 간에 소통의 기회를 제공할 수 있는 장입니다. 착한 생각을 나누는 진정성으로, 많은 관객들의 사랑을 받아 이제는 명실상부 국내 봄날의 대표 뮤직 페스티벌로 자리 잡았습니다! 다양한 장르의 음악도 듣고 먹거리도 즐길수있는 그린플러그드 서울!", "서울", 77000, "02-1234-5678", "난지 한강공원", new Date(), "", "b4GZNB2chbY", new Date(), new Date());
		ShowBoard showBoard7 = new ShowBoard(6, "재즈", "서울 재즈 페스티벌 2018", "올해로 12회를 맞이하는 서울재즈페스티벌! 음악페스티벌하면 서울재즈페스티벌을 빼놓을수없는데요~서울재즈페스티벌은 세계적으로도 높은 인지도를 얻고있는 축제입니다! 재즈에 대한 음악을 잘모르시거나 어려워하시는 분들이 많으신데 지루한 재즈에 대한 편견은그만~유명한 재즈 거장들과 수준높은 음악성과 대중성을 겸비한 국내외 아티스들까지 참여하여 다양한 장르의 뮤지션들의 공연을 즐길 수 있습니다~ 흥겹고 매력적인 재즈페스티벌! 다양한 이벤트와 즐길거리들이 많아 누구나 즐길 수 있는 페스티벌입니다", "서울", 155000, "02-1234-5678", "올림픽공원", new Date(), "", "GJIhzEqykkY", new Date(), new Date());
		ShowBoard showBoard8 = new ShowBoard(7, "DJ", "월드 디제이 페스티벌", "대한민국 최고의 EDM 페스티벌인 월디페! 그간 월디페는 저스티스, 아비치, 펜듈럼, 알란워커등 EDM씬에서 가장 핫한 디제이·프로듀서들이 내한 공연을 거쳐갔습니다. 매년 5만명 이상의 관객들은 동원하며 국내 최고의 EDM페스티벌로 자리매김 했죠! 올해는 작년보다 1.5배 커진 초대형 메인스테이지와 업그레인드된 서브스테이지로 변화된 무대를 선보인다고 합니다. 핫한 라인업들로 대중들의 기대를 한몸에 받고있는 월디페! 4월3일 최종라인업 발표로 더욱 기대가 되네요", "서울", 89000, "02-1234-5678", "올림픽공원", new Date(), "", "O5uKbd9EFoo", new Date(), new Date());
		ShowBoard showBoard9 = new ShowBoard(8, "DMZ", "DMZ 피스트레인 뮤직페스티벌 2018", "현재 일반 구매가 가능한 티켓은 모두 매진되었지만, 강원도민 혹은 강원도 내에서 현재 군복무 중인 군인은 사전 예약 없이 현장에서 무료로 입장할 수 있어요! ", "서울 강원도", 0, "02-1234-5678", "서울 플랫폼창동61, 철원 고석정, 월정리역, 노동당사 ", new Date(), "", "6L5RY7V7-W0", new Date(), new Date());
		ShowBoard showBoard10 = new ShowBoard(9, "폭스바겐", "레인보우 페스티벌", "자라섬에서 펼쳐지는 레인보우 캠핑 &뮤직페스티벌은 오토캠핑, 카라반, 캠핑패키지 2,000동이 모두 사전매진 될 정도로 인기가 많은 축제에요! 낮부터 밤까지 All night 스테이지로 운영되는 레인보우 축제에서는 특별하고 로맨틱한 일탈을 즐길 수 있어요! 스테이지가 나뉘어져 있는 레인보우 뮤직페스티벌에서는 다이나믹 듀오, 윤하, 10CM등 다양한 장르의 뮤지션의 공연을 관람할 수 있습니다. 해가 지면 시작되는 미드나잇 라운지는 페스티벌을 방문했다면 놓치지 말아야 하는 필수 코스! 몽환적이고 환상적인 디제잉 공연 즐기며 그 동안 잠들어 있던 흥을 불태울 시간이에요! 뮤직페스티벌 한 켠에서는 플리마켓과 캠핑 레크리에이션, 스탠드 업 코미디 쇼 등 관객이 함께 참여할 수 있는 부스도 마련되어 있습니다. 가족과 친구들과 함께 방문했다면 이 곳에서 잊지 못할 추억을 만들어 보세요.", "경기도", 66000, "010-3360-7846", "경기도 가평군 자라섬", new Date(), "", "cd1gXaJMAwQ", new Date(), new Date());
		ShowBoard showBoard11 = new ShowBoard(10, "울트라", "울트라 코리아 2018", "울트라 뮤직페스티벌은 1999년 미국 마이애미에서 시작된 일렉트로닉 댄스 뮤직 축제로, 전세계에서 매년 10만명 이상이 참가할 정도로 규모가 큰 글로벌 축제에요. 매년 우리나라에서는 아시아 최대 규모로 울트라 뮤직페스티벌이 열리고 있지요. 특히 올해에는 빌보드 연속 1위의 기록을 가지고 있는 뮤지션 체인스 모커스, 스티브 안젤로, 아이스 큐브 등 유명 뮤지션들이 참여하며, K-pop 가수로는 씨엘, 도끼, 드렁큰타이거와 윤미래, 비지 등이 총 출동 한다는 소식이 전해져 많은 음악 팬들의 시선이 집중되고 있어요.  예쁘게 꾸며 입는 것도 좋겠지만, 장시간 뛰어 놀기 위해서는 편안한 신발과, 소지품을 넣을 수 있는 작은 가방은 필수! 만 19세 이상 출입 가능한 뮤직페스티벌이기 때문에 신분증을 꼭 챙기셔야 해요!", "서울", 140000, "02-2240-8800", "서울특별시 송파구 올림픽로 25 잠실 종합운동장", new Date(), "", "qF-aQHNiR4w", new Date(), new Date());
		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm");
//		String sb_startdate = dateFormat.format(Calendar.getInstance().getTime());
		String dateString1 = "2018-12-24 23:59";
		String dateString2 = "2018-12-30 23:59";
 		Date startdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateString1);
 		Date enddate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateString2);
		ShowBoard showBoard12 = new ShowBoard(1, "황총민", "밴드 리턴", "우리가 돌아왔다", "서울", 0, "02-234-4732", "서울시 강남구 M모 클럽", new Date(), "162.png", "asdasfewr", startdate, enddate);
		
		
//		int result1 = showboardDao.insert(showBoard1);
//		int result2 = showboardDao.insert(showBoard2);
//		int result3 = showboardDao.insert(showBoard3);
//		int result4 = showboardDao.insert(showBoard4);
//		int result5 = showboardDao.insert(showBoard5);
//		int result6 = showboardDao.insert(showBoard6);
//		int result7 = showboardDao.insert(showBoard7);
//		int result8 = showboardDao.insert(showBoard8);
//		int result9 = showboardDao.insert(showBoard9);
//		int result10 = showboardDao.insert(showBoard10);
//		int result11 = showboardDao.insert(showBoard11);
		int result12 = showboardDao.insert(showBoard12);
		
		logger.info("Insert result = {}", result12);
		logger.info("startdate: ", startdate);
		logger.info("enddate: ", enddate);
	}

	private void testSelectAll() {
		List<ShowBoard> list = showboardDao.select();
		for (ShowBoard sb : list) {
			logger.info("{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}", sb.getSb_no(), sb.getSb_nm(),
					sb.getSb_title(), sb.getSb_content(), sb.getSb_city(), sb.getSb_price(), sb.getSb_tel(),
					sb.getSb_locinfo(), sb.getSb_regdate(), sb.getSb_img(), sb.getSb_video(), sb.getSb_startdate(),
					sb.getSb_enddate());
		}
	}

	private void testSelectBySbNo() {
		ShowBoard sb = showboardDao.select(2);
		logger.info("{}, {}, {}", sb.getSb_no(), sb.getSb_nm(), sb.getSb_content());
	}

	private void testUpdate() {
		ShowBoard sb = new ShowBoard(1, null, "이거는 테스트", "이 공연은 취소되었습니다.", "없음", 0, "없음", "없음", new Date(), "0", "0",
				new Date(), new Date());
		int result = showboardDao.update(sb);
		logger.info("update result = {}", result);
	}

	private void testDelete() {
		int result = showboardDao.delete(4);
		logger.info("delete result = {}", result);
	}

	private void testTotalCount() {
		int result = showboardDao.getNumOfShowBoardRecords();
		logger.info("totalCount result = {}", result);
	}

	private void testSearch() {
		List<ShowBoard> list = showboardDao.searchShowBoard("5");
		for (ShowBoard sb : list) {
			logger.info("{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}", sb.getSb_no(), sb.getSb_nm(),
					sb.getSb_title(), sb.getSb_content(), sb.getSb_city(), sb.getSb_price(), sb.getSb_tel(),
					sb.getSb_locinfo(), sb.getSb_regdate(), sb.getSb_img(), sb.getSb_video(), sb.getSb_startdate(),
					sb.getSb_enddate());
		}
	}
}
