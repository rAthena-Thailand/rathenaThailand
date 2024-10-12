/***********************************/
/***********    Shakto      ********/
/**    https://ronovelty.com/     **/
/***********************************/

#ifndef	_STALL_HPP_
#define	_STALL_HPP_

#include "../common/cbasetypes.hpp"
#include "../common/db.hpp"
#include "../common/mmo.hpp"

#include "map.hpp" // struct block_list
#include "status.hpp" // struct status_change
#include "unit.hpp" // struct unit_data

#define START_STALL_NUM 90000000
#define MAX_STALL_SLOT 5
#define BUYINGSTALL_MAX_PRICE 99990000
#define BUYINGSTALL_MAX_AMOUNT 9999
#define STALL_TAX 5 // 5% as KRO (over 10 m zeny)

class map_session_data;
struct block_list;
struct view_data;
struct status_change;
struct mail_message;

/// result for close stall ui constants
enum e_stall_result
{
	STALLSTORE_OK                    = 0,  //
	STALLSTORE_POSITION              = 2,  // Not allowed on tte position
	STALLSTORE_OVERWEIGHT            = 8,  // Overweight error
};

struct s_stall_data {
	struct block_list bl;
	struct view_data vd;
	struct status_change sc; //They can't have status changes, but.. they want the visual opt values.

	struct item items_inventory[MAX_STALL_SLOT];
	uint32 price[MAX_STALL_SLOT];
	uint32 itemId[MAX_STALL_SLOT];
	uint16 amount[MAX_STALL_SLOT];

	bool type; // 0 vending 1 buying

	int vended_id, vender_id;
	int vend_num;
	int timer;
	char message[MESSAGE_SIZE];
	char name[NAME_LENGTH];

	unsigned int expire_time;
};

extern std::vector<s_stall_data *> stall_db;
extern std::vector<mail_message> stall_mail_db;
void do_init_stall(void);
void do_final_stall(void);

int8 stall_ui_open(map_session_data* sd, uint16 skill_lv, short type);
int8 stall_vending_setup(map_session_data* sd, const char* message, const int16 xPos, const int16 yPos, uint8 *data, int count);
int8 stall_buying_setup(map_session_data* sd, const char* message, const int16 xPos, const int16 yPos, const struct STALL_BUYING_SET_sub* itemlist, int count, uint64 total_price);
void stall_vending_listreq(map_session_data* sd, int id);
void stall_buying_listreq(map_session_data* sd, int id);
void stall_vending_purchasereq(map_session_data* sd, int aid, int uid, const uint8* data, int count);
void stall_buying_purchasereq(map_session_data* sd, int aid, int uid, const struct PACKET_CZ_REQ_TRADE_BUYING_STORE_sub* itemlist, unsigned int count );
void stall_remove(struct s_stall_data* st);
void stall_vending_save(struct s_stall_data* st);
void stall_buying_save(struct s_stall_data* st);
void stall_close(map_session_data* sd);
void stall_vending_getbackitems(struct s_stall_data* st);
void stall_buying_getbackzeny(struct s_stall_data* st);
bool stall_isStallOpen(unsigned int CID);
bool stall_searchall(map_session_data* sd, const struct s_search_store_search* s, const struct s_stall_data* st, short type);
TIMER_FUNC(stall_timeout);
TIMER_FUNC(stall_init);
TIMER_FUNC(stall_mail_queue);

#endif /* _STALL_HPP_ */
